class ItemsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @item = Item.find(params[:id])
    respond_to { |format| format.js }
  end

  def create
    @item = Item.create(item_params)
    flash[:notice] = @item.errors.empty? ? "Item was successfully created." : "Error: Item was not created."
    redirect_to :back
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash[:notice] = @item.errors.empty? ? "Item was successfully updated." : "Error: Item was not updated."
    redirect_to :back
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to @item.project
  end

  private

  def item_params
    params.require(:item).permit(:name, :type, :project_id, :status, :item_type, :created_by)
  end

end
