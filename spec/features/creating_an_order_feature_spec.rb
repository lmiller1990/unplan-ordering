require 'rails_helper'

feature 'create an order', type: :feature do
  scenario 'order is created with products and saved to database' do
    visit root_path
    click_on 'Create order'

    expect { click_on 'Create' }.to change(Order, :count).by(1)
  end
end
