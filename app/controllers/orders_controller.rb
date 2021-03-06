class OrdersController < ApplicationController
  def create
  end

  def index
    @orders = Order.all
    @shopping_lists = []
    @was_created = false

    @orders.each do |order|
      @shopping_list = ShoppingList.find_or_create_by(order_id: order.id) do |s|
        @was_created = true
      end

      order.products.each_with_index do |p,idx|
        item = nil
        if @was_created
          # shopping list creation date should be same as order!
          @shopping_list.update_attributes(created_at: order.created_at)
          item = @shopping_list.shopping_items.build
        else
          item = @shopping_list.shopping_items[idx]
        end
        if !item.nil?
          item.set_shopping_item_attributes(p)
          if item.save
            # no problems
            item.update_attributes(shopping_list_id: @shopping_list.id)
          else
            raise "Error saving item: #{item.inspect}"
          end
        end
        #@shopping_items.push(@shopping_list.items_needed_to_order)
      end
      @shopping_lists.push(@shopping_list)
    end

    @lists = Kaminari.paginate_array(@shopping_lists.sort_by {
      |i| i.created_at
    }.reverse).page(params[:page]).per(5)
  end

  def new
    @order = Order.create!
    session[:current_order_id] = @order.id
    @products = @order.products
    redirect_to @order
  end

  def update
    @order = Order.find(params[:id])

    (0...total_order_products).each do |idx|
      params[:order][:products_attributes][idx.to_s].each do |k,v|
        @order.products[idx].update_attribute(k, v) unless k == 'id'
      end
    end

    flash[:success] = "Order updated!"
    redirect_to @order
  end

  def show
    @order = Order.find(params[:id])
    @order_products = []
    @order.products.each do |p|
      if p.order_today?
        @order_products.push(p)
      end
    end

    @shopping_list = ShoppingList.new
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = "Order remove from system."
    redirect_to :back
  end

  private

  def total_order_products
    if !params[:order].nil?
      params[:order][:products_attributes].size
    else
      return 0
    end
  end
end
