class ShoppingItem < ApplicationRecord

  belongs_to :shopping_list

  scope :need_to_order, -> { where(need_to_order: true) }

  def set_shopping_item_attributes(product)
    self.item_name = product.name
    self.item_cost = product.price
    self.item_amount = product.desired_total - product.in_stock
    self.total_cost = self.item_amount * self.item_cost
    self.need_to_order = product.in_stock <= product.theshold_to_order ? true : false
  end
end
