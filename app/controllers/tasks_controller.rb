class TasksController < ApplicationController
  before_action :authenticate_user!

  def edit
    @task = Task.find(params[:id])
    respond_to { |format| format.js }
  end

  def create
    @task = Task.new(task_params)

      if @task.save
        respond_to do |format|
          format.html { redirect_to :back, notice: 'Task was successfully created.' }
          format.js
        end
      else
        redirect_to :back
      end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to @task.project, notice: 'Task was successfully updated.' }
      format.js
    end
  end

  def toggle_starred
    @task = Task.find(params[:id])
    @task.update(starred: @task.starred.!)
    respond_to { |format| format.js }
  end

  def toggle_completed
    @task = Task.find(params[:id])
    @task.update(completed: @task.completed.!)
    @task.update(completed_at: DateTime.now, starred: false) if @task.completed
    respond_to { |format| format.js }
  end
  

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @task.project }
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :due_date_date, :due_date_time, :completed, :project_id, :user_id, :item_id, :starred, :completed_at, :created_by)
  end

  def param_updated?(param_name) task_params[param_name].present? end

end
