class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.create(item_params)
    flash[:notice] = @item.errors.empty? ? "Item was successfully created." : "Error: Item was not created."
    redirect_to :back
  end

  def update
    @item.update(item_params)
    flash[:notice] = @item.errors.empty? ? "Item was successfully updated." : "Error: Item was not updated."
    redirect_to :back
  end

  def destroy
    @item.destroy
    redirect_to @item.project
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :type, :project_id, :status, :item_type, :created_by)
  end

end
