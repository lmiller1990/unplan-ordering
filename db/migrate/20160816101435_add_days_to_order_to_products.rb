class AddDaysToOrderToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :days_to_order, :string, array: true, default: ["Everyday"]
  end
end
