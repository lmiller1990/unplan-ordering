class OrdersController < ApplicationController
  def create
  end

  def index
  end

  def new
    @order = Order.create!
    @products = @order.products
    flash[:success] = "今日の発注をしましょう"
    redirect_to @order
  end

  def update
    @order = Order.find(params[:id])

    (0...total_order_products).each do |idx|
      params[:order][:products_attributes][idx.to_s].each do |k,v|
        @order.products[idx].update_attribute(k, v) unless k == 'id'
      end
    end

    flash[:success] = "発注をアップデートした"
    redirect_to @order
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def total_order_products
    params[:order][:products_attributes].size
  end
end
