class PagesController < ApplicationController
  def home
  end

  def dashboard
  	@projects = Project.all
  	@tasks = Task.incomplete.order("due_date")
  end

  def calendar
  	@tasks = Task.incomplete.due.order("due_date")
    @tasks_by_date = @tasks.group_by {|t| t.due_date.to_date}
  end


end
