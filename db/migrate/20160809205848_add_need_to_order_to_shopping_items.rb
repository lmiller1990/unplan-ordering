class AddNeedToOrderToShoppingItems < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_items, :need_to_order, :boolean, default: false
  end
end
