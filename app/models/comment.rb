class Comment < ActiveRecord::Base
	belongs_to :project

	belongs_to :user
	delegate :name, to: :user, prefix: true

	default_scope { includes(:user, :project)}

	validates :project, presence: true
	validates :user, presence: true
	validates :content, presence: true

end