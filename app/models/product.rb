class Product < ApplicationRecord
  belongs_to :order, optional: true

  scope :base_products, -> { where(base_product: true) }
end
