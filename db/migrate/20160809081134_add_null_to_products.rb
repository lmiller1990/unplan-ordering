class AddNullToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:products, :order_id, true)
  end
end
