class Task < ActiveRecord::Base
	belongs_to :project
	delegate :name, to: :project, prefix: true, allow_nil: true

	belongs_to :user
	delegate :name, to: :user, prefix: true

	belongs_to :item
	delegate :name, to: :item, prefix: true, allow_nil: true

	has_many :notes, as: :noteable

	default_scope { includes(:project, :user, :notes) }

	scope :completed, -> { where(completed: true) }
	scope :incomplete, -> { where(completed: false) }

	validates :name, presence: true

	date_time_attribute :due_date, time_zone: "Eastern Time (US & Canada)"

  def item_tasks
    if item then item.tasks else project.tasks.general end
  end

	def self.general
    where(:item_id => nil)
  end

  def late?
    due_date && due_date < DateTime.now
  end

  def self.sort_by_priority_and_due_date
    where(starred: true).sort_by_due_date +
    where(starred: false).sort_by_due_date
  end

  def self.sort_by_due_date
    where.not(due_date: nil).order("due_date, name") +
    where(due_date: nil).order("created_at, name")
  end

end

