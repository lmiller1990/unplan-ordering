class AddDefaultValueToThresholdToOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :theshold_to_order, :integer, default: 0
  end
end
