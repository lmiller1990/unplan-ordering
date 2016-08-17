class AddDefaultValuesToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :integer, default: 0
    change_column :products, :unit_type, :string, default: ""
    change_column :products, :desired_total, :integer, default: 0
    change_column :products, :name, :string, default: ""

    change_column :shopping_items, :item_amount, :integer, default: 0
    change_column :shopping_items, :total_cost, :integer, default: 0
    change_column :shopping_items, :item_name, :string, default: ""
  end
end
