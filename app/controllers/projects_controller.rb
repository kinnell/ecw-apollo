class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all.order("due_date")
	end

	def show
	end

	def new
		@project = Project.new
		@assignment = @project.assignments.build
	end

	def edit
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to projects_path, notice: 'Project was successfully created.'
		else
			render action: 'new'
		end
	end

	def update
		if @project.update(project_params)
			redirect_to @project, notice: 'Project was successfully updated.'
		else
		  render action: 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_url
	end

	def complete
    @project = Project.find(params[:id])
    if @project.update_attributes(:status => "Completed")
      @project.update_attributes(:end_date => DateTime.now)
      redirect_to :back
    end
  end

  def uncomplete
    @project = Project.find(params[:id])
    if @project.update_attributes(:status => "In Progress")
      @project.update_attributes(:end_date => nil)
      redirect_to :back
    end
  end


	private

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :due_date, :end_date, :priority, :description, :product_id, :status, assignments_attributes: [ :user_id, :project_id ])
	end


end