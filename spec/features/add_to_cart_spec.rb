# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor can add product to cart', type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |_n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 1,
        price: 64.99
      )
    end
  end

  scenario 'product is added to cart' do
    visit root_path
    first('.product').click_button('Add')
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end
end
