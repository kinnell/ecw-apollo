class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.sort_by {|p| p.name.downcase }
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.create(product_params)
    flash[:notice] = @product.errors.empty? ? "Product was successfully created." : "Error: Product was not created."
    redirect_to :back
  end

  def update
    @product.updated(product_params)
    flash[:notice] = @product.errors.empty? ? "Product was successfully updated." : "Error: Product was not successfully updated."
    redirect_to :back
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name)
    end
end
