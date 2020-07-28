# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User can login', type: :feature, js: true do
  before :each do
    @user = User.create!(name: 'Sandeep Chopra',
                         email: 'sandeep.chopra@live.com',
                         password: 'warlord420',
                         password_confirmation: 'warlord420')
    @user.save
  end

  scenario 'user is able to login' do
    visit '/login'
    fill_in 'email', with: 'sandeep.chopra@live.com'
    fill_in 'password', with: 'warlord420'
    click_on 'Sign in'
    expect(page).to have_content('Sign out')
    save_screenshot
  end
end
