class AddBaseProductFieldToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :base_product, :boolean, default: false, null: false
  end
end
