require 'rails_helper'

feature 'creating a new base product', type: :feature do
  scenario 'new base product added' do
    visit root_path
    click_on 'New Product'
    fill_in :product_name, with: 'dumplings'
    fill_in :product_theshold_to_order, with: '15'

    expect do
      click_on 'Create Product'
    end.to change(Product, :count).by(1)
    expect(page).to have_content('Product created')
  end
end
