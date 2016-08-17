class AddDefaultCostToItem < ActiveRecord::Migration[5.0]
  def change
    change_column :shopping_items, :item_cost, :integer, default: 0
  end
end
