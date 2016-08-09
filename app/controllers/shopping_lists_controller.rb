class ShoppingListsController < ApplicationController
  def create
    @shopping_list = ShoppingList.new
    


    current_order.shopping_list_id
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
