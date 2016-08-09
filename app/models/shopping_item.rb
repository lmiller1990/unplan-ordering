class ShoppingItem < ApplicationRecord
  belongs_to :shopping_list

    def set_shopping_item_attributes(product)
    self.item_name = product.name
    self.item_cost = product.price
    self.item_amount = product.desired_total - product.in_stock
    self.total_cost = item_amount * item_cost
  end
end
