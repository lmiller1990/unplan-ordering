require 'rails_helper'

feature 'create a shopping list', type: :feature do
  scenario 'a shopping list based on an order is generated and displayed' do
    product = FactoryGirl.create(:product, base_product: true)
    another_product = FactoryGirl.create(:product, base_product: true)

    visit root_path
    click_on "新しい発注"

    expect do
      expect do
        click_on 'Create Shopping list'
      end.to change(ShoppingList, :count).by(1)
    end.to change(ShoppingItem, :count).by(2)
  end
end
