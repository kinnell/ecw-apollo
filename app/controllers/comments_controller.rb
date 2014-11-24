class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.create(comment_params)
    respond_to { |format| format.js }
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to { |format| format.js }
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :project_id)
  end

end

