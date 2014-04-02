class PagesController < ApplicationController
  def home
  end

  def dashboard
  	@projects = Project.all
  	@tasks = Task.incomplete.order("due_date")
  end

end
