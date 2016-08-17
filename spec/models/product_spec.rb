require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#base_products' do
    it 'returns a list of base products' do
      base_product = FactoryGirl.create(:product, base_product: true)
      non_base_product = FactoryGirl.create(:product, base_product: false)

      expect(Product.base_products).to match_array(base_product)
    end
  end

  describe '.order_today?' do
    it 'returns a list of products to be ordered today' do
      product_to_order_today = FactoryGirl.create(:product, days_to_order: [Time.now.strftime("%A")])
      product_not_to_order = FactoryGirl.create(:product, days_to_order: [Time.now.tomorrow.strftime("%A")])

      expect(product_to_order_today.order_today?).to be_truthy
      expect(product_not_to_order.order_today?).to be_falsey
    end
  end
end
