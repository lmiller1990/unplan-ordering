require 'rails_helper'

feature 'create a shopping list', type: :feature do
  scenario 'a shopping list based on an order is generated and displayed' do
    product = FactoryGirl.create(:product)
    order = FactoryGirl.create(:order, products: [product])

    visit order_path(order)
    expect { click_on 'Create Shopping List' }.to change(ShoppingList, :count).by(1)
  end
end
