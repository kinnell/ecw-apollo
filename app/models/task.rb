class Task < ActiveRecord::Base
	belongs_to :project
	delegate :name, to: :project, prefix: true, allow_nil: true

	belongs_to :user
	delegate :name, to: :user, prefix: true

	belongs_to :item
	delegate :name, to: :item, prefix: true, allow_nil: true

	has_many :notes, as: :noteable

	default_scope { includes(:project, :user, :notes) }

	scope :completed, -> { where(:completed => true) }
	scope :incomplete, -> { where(:completed => false) }

	scope :notDue, -> { where(:due_date => nil) }
	scope :due, -> { where.not(:due_date => nil) }

	scope :starred, -> { where(:starred => true) }
	scope :notStarred, -> { where(:starred => false) }



	validates :name, presence: true

	date_time_attribute :due_date, time_zone: "Eastern Time (US & Canada)"

	def late?() due_date < DateTime.now if due_date end

	def self.general() where(:item_id => nil) end

	def self.priority_sort
		starred.sort_by_due + notStarred.sort_by_due
	end

	def self.sort_by_due
		due.order("due_date, name") + notDue.order("created_at, name")
	end

end

