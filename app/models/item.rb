class Item < ActiveRecord::Base
	belongs_to :project
	delegate :name, to: :project, prefix: true

	has_many :tasks

	validates :name, presence: true

	default_scope { includes(:project) }

end