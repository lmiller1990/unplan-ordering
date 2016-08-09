require 'rails_helper'

feature 'create a shopping list', type: :feature do
  scenario 'a shopping list based on an order is generated and displayed' do
    product = FactoryGirl.create(:product)

    visit root_path
    click_on "新しい発注"
    
    expect { click_on 'Create Shopping list' }.to change(ShoppingList, :count).by(1)
  end
end
