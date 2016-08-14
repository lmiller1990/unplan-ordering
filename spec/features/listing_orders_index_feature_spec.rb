require 'rails_helper'

feature 'viewing historical orders', type: :feature do
  scenario 'shopping lists are displayed for all previous orders' do
    base_product = FactoryGirl.create(:product, base_product: true)
    order = FactoryGirl.create(:order)
    another_order = FactoryGirl.create(:order)

    visit orders_path
    expect(Order.count).to eq 2
    expect(page).to have_content('Shopping List for', count: 2)
  end
end
