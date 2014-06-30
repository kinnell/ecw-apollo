class UserNotifier < ActionMailer::Base
  default from: "jay.perry@eclinicalworks.com"

  def new_project_email(project)
  	for user in project.users
	  	mail(to: user.email, subject: "[eCW apollo] New Project!")
	  end
  end

end
