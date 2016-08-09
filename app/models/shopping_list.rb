class ShoppingList < ApplicationRecord
  has_one :order
  has_many :shopping_items
end
