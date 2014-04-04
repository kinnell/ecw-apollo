class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
		@assignment = @project.assignments.build(:project_id => @project.id)
	end

	def edit
	end

	def create
		@project = Project.new(project_params)
		@assignment = @project.assignments.build(:project_id => @project.id)

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

	private

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :due_date, :description, :product_id)
	end

end