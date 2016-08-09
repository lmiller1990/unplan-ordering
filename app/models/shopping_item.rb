class ShoppingItem < ApplicationRecord
  belongs_to :shopping_list

    def set_shopping_item_attributes(product)
    self.item_name = product.name
    self.item_cost = product.price
    puts product.desired_total, ' ', product.in_stock, product.inspect
    self.item_amount = product.desired_total - product.in_stock
    self.total_cost = item_amount * item_cost
    self.need_to_order = product.in_stock <= product.theshold_to_order ? true : false
  end
end
