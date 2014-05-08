class Project < ActiveRecord::Base
	include DateTimeAttribute

	belongs_to :product

	has_many :tasks, dependent: :destroy
	has_many :items, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_many :assignments, :dependent => :destroy
	has_many :users, :through => :assignments

	accepts_nested_attributes_for :assignments, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true

	validates :name, presence: true
	validates :product_id, presence: true

	scope :completed, -> { where(status: ["Completed", "Cancelled"]) }
	scope :incomplete, -> { where.not(status: ["Completed", "Cancelled"]) }

	date_time_attribute :due_date, time_zone: "Eastern Time (US & Canada)"

	def progress_percent
		tasks.exists? ? (100*(tasks.completed.count.to_f/tasks.count.to_f)).round : 0
	end

	def self.custom_sort
		where(:starred => true).sort_by_status + where(:starred => false).sort_by_status
	end

	def self.sort_by_status
		(where(:status => "In Progress").sort_by_dueDate + where(:status => "Waiting").sort_by_dueDate + where(:status => "On Hold").sort_by_dueDate + where(:status => "In Queue").sort_by_dueDate + where(:status => "Completed").sort_by_dueDate + where(:status => "Cancelled").sort_by_dueDate).uniq
	end

	def self.sort_by_dueDate() order("due_date, name") end

	def isLate() due_date ? ((due_date < DateTime.now) & (status != "Completed") && (status != "Cancelled")) : false end



end