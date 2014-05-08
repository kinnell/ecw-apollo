class ProjectsController < ApplicationController
   before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = current_user.projects
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
			respond_to do |format|
				format.html { redirect_to :back, notice: 'Project was successfully updated.' }
				format.js
			end
		else
		  render action: 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_url
	end

  def toggle_starred
  	@project = Project.find(params[:id])
  	if @project.update_attributes(:starred => @project.starred.!)
  		redirect_to :back
  	end
  end

	private

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :due_date, :due_date_date, :due_date_time, :end_date, :starred, :assigned_by, :description, :product_id, :status, assignments_attributes: [ :user_id, :project_id ])
	end


end