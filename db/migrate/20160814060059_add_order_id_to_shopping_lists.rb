class AddOrderIdToShoppingLists < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_lists, :order_id, :integer
  end
end
