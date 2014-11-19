class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all.sort_by {|p| p.name.downcase }
  end

  def edit
    @product = Product.find(params[:id])
    respond_to { |format| format.js }
  end

  def create
    @product = Product.create(product_params)
    flash[:notice] = @product.errors.empty? ? "Product was successfully created." : "Error: Product was not created."
    redirect_to :back
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    flash[:notice] = @product.errors.empty? ? "Product was successfully updated." : "Error: Product was not successfully updated."
    redirect_to :back
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end

end
