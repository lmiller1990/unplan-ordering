class CreateShoppingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_items do |t|
      t.integer :item_amount
      t.integer :item_cost
      t.integer :total_cost
      t.string :item_name
      t.references :shopping_list, foreign_key: true

      t.timestamps
    end
  end
end
