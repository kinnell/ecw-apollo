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
    if @comment.update(comment_params)
      redirect_to :back, notice: 'Comment was successfully updated.'
    else
      render 'edit'
    end
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
