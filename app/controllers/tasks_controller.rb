class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.incomplete.order("due_date")
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

      if @task.save
        redirect_to :back, notice: 'Task was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
      if @task.update(task_params)
        respond_to do |format|
          format.html { redirect_to @task.project, notice: 'Task was successfully updated.' }
          format.js
          format.json
        end

      else
        render action: 'edit'
      end
  end

  def destroy
    @task.destroy
      redirect_to @task.project
  end

  def toggle_starred
    @task = Task.find(params[:id])
    if @task.update_attributes(:starred => @task.starred.!)
      redirect_to :back
    end
  end


  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :due_date, :completed, :project_id, :user_id, :item_id, :starred, :completed_at)
    end
end
