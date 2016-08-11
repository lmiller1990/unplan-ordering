class Order < ApplicationRecord
  after_create :add_products
  has_one :product_list
  has_many :products
  belongs_to :shopping_list, optional: true, dependent: :destroy

  accepts_nested_attributes_for :products

  private

   def add_products
     base_products = Product.base_products

     base_products.each do |product|
       attrs = product.attributes.except('id')
       attrs['base_product'] = false
       self.products.create(attrs)
     end
   end
end
