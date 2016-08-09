class Product < ApplicationRecord
  belongs_to :order

  scope :base_products, -> { where(base_product: true) }
end
