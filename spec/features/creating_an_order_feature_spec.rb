require 'rails_helper'

feature 'create an order', type: :feature do
  scenario 'order is created with products and saved to database' do
    base_product = FactoryGirl.create(:product, base_product: true)

    visit root_path
    expect do
      expect do
        click_on 'New Order'
      end.to change(Order, :count).by(1)
    end.to change(Product, :count).by(1)

    fill_in :order_products_attributes_0_in_stock, with: 50
    click_on 'Update Order'

    expect(page).to have_selector("#order_products_attributes_0_name[value='#{base_product.name}']")
    expect(page).to have_selector("#order_products_attributes_0_in_stock[value='50.0']")
  end
end
