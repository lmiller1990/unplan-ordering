class ShoppingList < ApplicationRecord

  has_one :order
  has_many :shopping_items

  def all_shopping_items
    self.shopping_items
  end

  def items_needed_to_order
    all_shopping_items.need_to_order
  end
end
