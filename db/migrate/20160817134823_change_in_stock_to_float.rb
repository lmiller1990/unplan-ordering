class ChangeInStockToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :in_stock, :float, scale: 4, precision: 2
  end
end
