# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'it is valid if it has a name, email, password, password confirmation'

    it 'its invalid without name'

    it 'its invalid without email'

    it 'its invalid if password & confirmation do not match'

    it 'its invalid if emails already exists'

    it 'its invalid if password length is less than 10 characters'
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
