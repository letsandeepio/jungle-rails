# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      described_class.new(name: 'Sandeep Chopra',
                          email: 'xyz@yahoo.com',
                          password: 'warlord420',
                          password_confirmation: 'warlord420')
    end

    it 'it is valid if it has a name, email, password, password confirmation' do
      expect(subject).to be_valid
    end

    it 'its invalid without a name' do
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'its invalid without a email' do
      subject.email = nil
      expect(subject).to be_invalid
    end

    it 'its invalid without a password' do
      subject.password = nil
      expect(subject).to be_invalid
    end

    it 'its invalid if password & confirmation do not match' do
      subject.password_confirmation = 'war'
      expect(subject).to be_invalid
      # puts subject.errors.full_messages
    end

    it 'its invalid if emails already exists' do
      subject.save

      duplicate_user = User.new(
        name: 'Sandeep Chopra',
        email: 'xyz@yahoo.com',
        password: 'warlord420',
        password_confirmation: 'warlord420'
      )
      expect(duplicate_user).to be_invalid
      # puts duplicate_user.errors.full_messages
    end

    it 'its invalid if password length is less than 10 characters' do
      subject.password = 'war'
      subject.password_confirmation = 'war'
      expect(subject).to be_invalid
    end

    describe '.authenticate_with_credentials' do
      it 'returns the user object if the user is authenticated' do
        subject.save
        # puts subject.inspect
        user = User.authenticate_with_credentials('xyz@yahoo.com', 'warlord420')
        expect(user).to be_instance_of(User)
      end

      it 'saves with spaces around the email' do
        subject.save
        user = User.authenticate_with_credentials('  xyz@yahoo.com ', 'warlord420')
        expect(user).to be_instance_of(User)
      end

      it 'saves if the email has caps' do
        subject.save
        user = User.authenticate_with_credentials('xyz@yahoo.com ', 'warlord420')
        expect(user).to be_instance_of(User)
      end
    end
  end
end
