class AddDefaultValueToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :in_stock, :integer, default: 0
  end
end
