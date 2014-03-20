class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = projects.build
	end

	def edit
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to :back, notice: 'Project was successfully created.'
		else
			render :new
		end
	end

	def update
		if @project.update(project_params)
			redirect_to projects_path, notice: 'Project was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path, notice: 'Project was successfully deleted.'
	end

	private

	def project_params
		params.require(:project).permit(:project)
	end

end