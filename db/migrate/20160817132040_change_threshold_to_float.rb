class ChangeThresholdToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :theshold_to_order, :float, precision: 2, scale: 4
  end
end
