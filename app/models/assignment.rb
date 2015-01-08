class Assignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

  after_create :send_notification_email

	private

	def send_notification_email
    ProjectsMailer.project_assigned_email(project, user).deliver
  end

end
