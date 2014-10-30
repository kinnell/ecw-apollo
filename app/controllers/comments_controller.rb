class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.create(comment_params)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end

  end

  def update
    @comment.update(comment_params)
    flash[:notice] = @comment.errors.empty? ? "Comment was successfully updated." : "Error: Comment was not updated."
    redirect_to :back
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end

  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :project_id)
  end

end

