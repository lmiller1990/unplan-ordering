require 'rails_helper'

feature 'creating a product', type: :feature do
  scenario 'only orderable on a monday' do
    visit root_path
    click_on "Create New Products"
    fill_in :product_name, with: "Product name"
    find('#product_days_to_order').find(:xpath, "option[1]").unselect_option
    find('#product_days_to_order').find(:xpath, "option[3]").select_option
    click_on "Create Product"

    expect(Product.first.days_to_order).to match_array(["Monday"])
  end
end
