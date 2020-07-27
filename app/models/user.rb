# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates :name, :password, :password_confirmation, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 10 }
  validates :password, confirmation: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    user if user&.authenticate(password)
  end
end
