require 'rails_helper'

feature 'create a shopping list', type: :feature do
  scenario 'a shopping list based on an order is generated and displayed' do
    product = FactoryGirl.create(:product, base_product: true)
    another_product = FactoryGirl.create(:product, base_product: true)

    visit root_path
    click_on "New Order"

    expect do
      expect do
        click_on 'Create Shopping list'
      end.to change(ShoppingList, :count).by(1)
    end.to change(ShoppingItem, :count).by(2)
    expect(page).to have_content('Shopping List for')
  end

  scenario 'an existing shopping list is updated' do
    product = FactoryGirl.create(:product, base_product: true)

    visit root_path
    click_on "New Order"
    click_on 'Create Shopping list'

    expect(page).to have_content('Shopping List for')

    visit root_path
    click_on 'Current Order'
    fill_in :order_products_attributes_0_in_stock, with: 3

    expect do
      click_on 'Create Shopping list'
    end.not_to change(ShoppingList, :count)
  end
end
