class Comment < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	validates :project, presence: true
	validates :user, presence: true
	validates :content, presence: true
end
