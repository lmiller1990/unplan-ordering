class ProductsController < ApplicationController
  def create
  end

  def edit
  end

  def index
    @products = Product.all
  end

  def show
  end
end
