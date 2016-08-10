require 'rails_helper'

RSpec.describe ShoppingItem, type: :model do
  describe '#need_to_order' do
    it 'scopes all items that need to be ordered' do
      shopping_list = FactoryGirl.create(:shopping_list)
      need_to_order_item = FactoryGirl.create(:shopping_item, need_to_order: true, shopping_list: shopping_list)
      do_not_need_to_order_item = FactoryGirl.create(:shopping_item, need_to_order: false, shopping_list: shopping_list)

      expect(ShoppingItem.need_to_order).to match_array(need_to_order_item)
    end
  end

  describe 'set_shopping_item_attributes' do
    context 'an item that has to be ordered' do
      it 'updates an item with amount, quantity to buy etc' do
        product = FactoryGirl.build(:product, name: 'cider', in_stock: 5, desired_total: 10, theshold_to_order: 8, price: 10)
        item = FactoryGirl.build(:shopping_item)
        item.set_shopping_item_attributes(product)

        expect(item.item_name).to eq product.name
        expect(item.item_amount).to eq 5
        expect(item.total_cost).to eq 50
        expect(item.need_to_order).to be_truthy
      end
    end

    context 'an item that does not need to be ordered' do
      it 'updates need to order field to be false' do
        product = FactoryGirl.build(:product, name: 'cider', in_stock: 9, desired_total: 10, theshold_to_order: 8, price: 10)
        item = FactoryGirl.build(:shopping_item)
        item.set_shopping_item_attributes(product)

        expect(item.item_name).to eq product.name
        expect(item.item_amount).to eq 1
        expect(item.total_cost).to eq 10
        expect(item.need_to_order).to be_falsey
      end
    end
  end
end
