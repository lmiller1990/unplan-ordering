class ShoppingListsController < ApplicationController
  def create
    @shopping_list = ShoppingList.new
    current_order.products.each do |p|
      item = @shopping_list.shopping_items.build

      # t.integer  "item_amount"
      # t.integer  "item_cost"
      # t.integer  "total_cost"
      # t.string   "item_name"
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
