class UserNotifier < ActionMailer::Base
  default from: "kinnell.shah@eclinicalworks.com"

  def new_project_email(users)
  	for user in users
	  	mail(to: user.email, subject: "[eCW apollo] New Project!")
	  end
  end

end
