class Project < ActiveRecord::Base
	include DateTimeAttribute
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller.current_user }

	belongs_to :product
  delegate :name, to: :product, prefix: true

	has_many :tasks, dependent: :destroy
	has_many :items, dependent: :destroy
	has_many :comments, dependent: :destroy

  has_many :assignments, dependent: :destroy
	has_many :users, through: :assignments
	accepts_nested_attributes_for :assignments, :reject_if => lambda { |a| a[:user_id].blank? }, allow_destroy: true

	validates :name, presence: true
	validates :product_id, presence: true

	default_scope { includes(:users, :product) }
	scope :active, -> { where(status: ["In Progress", "Waiting", "On Hold", "In Queue"]) }
	scope :completed, -> { where(status: ["Completed", "Cancelled"]) }
	scope :unassigned, -> { includes(:assignments).where(assignments: { user_id: nil }) }

	date_time_attribute :due_date, time_zone: "Eastern Time (US & Canada)"

	def creator
    User.find(self.created_by)
  end

	def self.sort_by_priority_and_status
    where(starred: true).sort_by_status +
    where(starred: false).sort_by_status
	end

  def self.sort_by_status
    where(status: "In Progress").order("due_date, name") +
    where(status: "Waiting").order("due_date, name") +
    where(status: "On Hold").order("due_date, name") +
    where(status: "In Queue").order("due_date, name") +
    where(status: "Completed").order("end_date, name") +
    where(status: "Cancelled").order("end_date, name")
  end

  def active?
    ["In Progress", "Waiting", "On Hold", "In Queue"].include? status
  end

	def late?
    active? && due_date && due_date < DateTime.now
  end

end
