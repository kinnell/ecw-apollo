class PagesController < ApplicationController
  before_action :authenticate_user!

  def calendar
    @tasks = current_user.tasks.due.order("due_date")
    @tasks_by_date = @tasks.group_by {|t| t.due_date.to_date}
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def changelog
  end

end
