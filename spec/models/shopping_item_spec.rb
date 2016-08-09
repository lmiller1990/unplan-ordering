require 'rails_helper'

RSpec.describe ShoppingItem, type: :model do
  describe '#set_shopping_item_attributes' do
    it 'updates an item with amount, quantity to buy etc' do
      product = FactoryGirl.build(:product, name: 'cider', in_stock: 5, desired_total: 10, theshold_to_order: 8, price: 10)
      item = FactoryGirl.build(:shopping_item)
      item.set_shopping_item_attributes(product)

      expect(item.item_name).to eq product.name
      expect(item.item_amount).to eq 5
      expect(item.total_cost).to eq 50
    end
  end
end
