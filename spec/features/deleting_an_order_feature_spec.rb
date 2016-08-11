require 'rails_helper'

feature 'viewing historical orders', type: :feature do
  scenario 'shopping lists are displayed for all previous orders' do
    order = FactoryGirl.create(:order)
    base_product = FactoryGirl.create(:product, order: order, base_product: true)

    visit orders_path
    expect do
      expect do
        click_on "Delete Order"
      end.to change(Order, :count).by(-1)
    end.to change(ShoppingList, :count).by(-1)
  end
end
