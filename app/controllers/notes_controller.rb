class NotesController < ApplicationController
  def index
	@noteable = Task.find(params[:task_id])
	@notes = @noteable.notes
  end

  def new
  end
end

