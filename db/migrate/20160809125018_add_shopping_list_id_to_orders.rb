class AddShoppingListIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shopping_list_id, :integer
  end
end
