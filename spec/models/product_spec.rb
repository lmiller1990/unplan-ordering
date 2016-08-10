require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#base_products' do
    it 'returns a list of base products' do
      base_product = FactoryGirl.create(:product, base_product: true)
      non_base_product = FactoryGirl.create(:product, base_product: false)

      expect(Product.base_products).to match_array(base_product)
    end
  end
end
