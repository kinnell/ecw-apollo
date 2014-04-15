class PagesController < ApplicationController
  def home
  end

  def calendar
    @tasks = current_user.projects.map{|p| p.tasks.incomplete.due}.first.order("due_date")
    @tasks_by_date = @tasks.group_by {|t| t.due_date.to_date}
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end


end
