class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :theshold_to_order
      t.integer :in_stock
      t.decimal :price
      t.string :name
      t.date :day_to_order
      t.string :unit_type

      t.timestamps
    end
  end
end
