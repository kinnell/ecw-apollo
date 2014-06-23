class Task < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	belongs_to :item

	has_many :notes, as: :noteable

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

