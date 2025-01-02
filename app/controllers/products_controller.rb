class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to sector_path(@product.sector), notice: "Product added successfully to #{@product.sector}!"
    else
      render :new, alert: "Failed to add the product. Please check the details."
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :sector_id)
  end
end
