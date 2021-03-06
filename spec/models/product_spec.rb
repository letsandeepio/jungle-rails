# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    electronics_category = Category.find_or_create_by! name: 'Electronics'

    subject do
      described_class.new(name: 'xyz',
                          price: 5000,
                          quantity: 2,
                          category: electronics_category)
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to be_invalid
    end
    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to be_invalid
    end
    it 'is not valid without a category' do
      subject.category = nil
      expect(subject).to be_invalid
    end
  end
end
