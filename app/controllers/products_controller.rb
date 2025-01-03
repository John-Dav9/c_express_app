class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show,]
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

  def edit
    @product
  end

  def update
    if @product.update(product_params)
    redirect_to product_path(@product), notice: "Secteur mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Produit introuvable."
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :sector_id, :image)
  end
end
