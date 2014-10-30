class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	after_commit :send_notification_email

	private

	def send_notification_email() UserNotifier.new_project_email(user, project).deliver end

end
