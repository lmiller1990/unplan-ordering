class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)

    if @product.save
      @product.update_attributes(base_product: true)
      @product.update_attributes(days_to_order: remove_blank_day)
      flash[:success] = "Product created"
    else
      flash[:failure] = "Product not created"
    end
    redirect_to root_path
  end

  def new
    @days = ["Everyday"] + Date::DAYNAMES

    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    flash[:success] = "Product updated"
    redirect_to products_path
  end

  def index
    @products = Product.base_products
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
    flash[:success] = "Product deleted"
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :theshold_to_order, :price, :unit_type, :desired_total, :days_to_order => [])
  end

  def remove_blank_day
    params[:product][:days_to_order] - [""]
  end
end
