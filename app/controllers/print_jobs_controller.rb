class PrintJobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = PrintJob.search(params[:q])
    @print_jobs = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.xls
      format.js
    end
  end

  def create
    @print_job = PrintJob.new(print_job_params)
    @print_job.save
    redirect_to :back
  end 

  def edit
    @print_job = PrintJob.find(params[:id])
    respond_to { |format| format.js }
  end

  def update
    @print_job = PrintJob.find(params[:id])
    @print_job.update(print_job_params)
    redirect_to :back
  end

  def destroy
    @print_job = PrintJob.find(params[:id])
    @print_job.destroy
    redirect_to :back
  end

  private

  def print_job_params
    params.require(:print_job).permit(:project_id, :number, :name, :account, :printer, :quantity, :rate, :total_quote, :rewards_percentage, :total_paid, :date_paid, :note)
  end

end
