# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor navigates to product page', type: :feature, js: true do
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

  scenario 'They are redirected to the product details page' do
    visit root_path

    save_screenshot

    first('.product').click_link('Details')

    expect(page).to have_css '.product-detail', count: 1

    save_screenshot
  end
end
