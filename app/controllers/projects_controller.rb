class ProjectsController < ApplicationController

  before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
    @q = Project.all.search(params[:q])
    @q.users_name_eq = current_user.name unless params[:q] && params[:q][:users_name_eq]
    @projects = @q.result(distinct: true)

    @projects = @projects.incomplete unless params[:q] && params[:q][:status_eq]

    @projects = @projects.priority_sort unless params[:q] && params[:q][:s]

    respond_to do |format|
      format.html
      format.js
    end

	end

	def show
	end

	def new
		@project = Project.new
		@assignment = @project.assignments.build
	end

	def edit
    respond_to { |format| format.js }
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to project_path(@project)
		else
      redirect_to :back
		end
	end

	def update
		if @project.update(project_params)
			respond_to do |format|
				format.html { redirect_to :back, notice: "Project was successfully updated." }
				format.js
			end
		else
      redirect_to :back
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
		params.require(:project).permit(:name, :due_date, :due_date_date, :due_date_time, :end_date, :starred, :assigned_by, :description, :product_id, :status, :created_by, user_ids: [])
	end

end
