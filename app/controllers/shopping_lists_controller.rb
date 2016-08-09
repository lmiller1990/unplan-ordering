class ShoppingListsController < ApplicationController
  def create
    @shopping_list = ShoppingList.create(order_id: current_order.id)
    current_order.products.each do |p|
      item = @shopping_list.shopping_items.build
      item.set_shopping_item_attributes(p)
      if item.save
        # no problems
        item.update_attributes(shopping_list_id: @shopping_list.id)
      else
        raise "Error saving item: #{item.inspect}"
      end
    end
  end

  def show
  end

  def index
  end

  private

  def shopping_list_params
    params.require(:shopping_list)
  end
end
