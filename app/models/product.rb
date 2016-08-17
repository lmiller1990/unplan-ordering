class Product < ApplicationRecord
  belongs_to :order, optional: true

  scope :base_products, -> { where(base_product: true) }

  def order_today?
    self.days_to_order.include?(Time.now.strftime("%A"))
  end
end
