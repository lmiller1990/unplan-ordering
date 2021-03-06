class ShoppingListsController < ApplicationController

  def create
    @was_created = false
    @shopping_list = ShoppingList.find_or_create_by(order_id: current_order.id) do |s|
      @was_created = true
    end

    if @was_created
      current_order.update_attributes(shopping_list_id: @shopping_list.id)
      current_order.save
    end

    current_order.products.each_with_index do |p,idx|
      item = nil
      if @was_created
        item = @shopping_list.shopping_items.build
      else
        item = @shopping_list.shopping_items[idx]
      end

      item.set_shopping_item_attributes(p)
      if item.save
        # no problems
        item.update_attributes(shopping_list_id: @shopping_list.id)
      else
        raise "Error saving item: #{item.inspect}"
      end
    end

    redirect_to @shopping_list
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @current_order = current_order
    @shopping_items = @shopping_list.items_needed_to_order

    respond_to do |format|
      format.pdf do
        render pdf: "shop_list.pdf",
        template: "shopping_lists/show.pdf.erb",
        encoding: 'UTF-8',
        locals: { shopping_list: @shopping_list, current_order: @current_order, shopping_items: @shopping_items }
      end
      format.html
    end
  end

  def index
  end

  private

  def shopping_list_params
    params.require(:shopping_list)
  end
end
