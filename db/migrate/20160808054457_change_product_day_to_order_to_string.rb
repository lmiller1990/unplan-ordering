class ChangeProductDayToOrderToString < ActiveRecord::Migration
  def self.up
    change_column :products, :day_to_order, :string
  end

  def self.down
    change_column :products, :day_to_order, :date
  end
end
