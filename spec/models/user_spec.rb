# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect(duplicate_user).not_to be_valid
    end

    it 'is not valid with an email that exceeds the maximum length' do
      user.email = 'a' * 106 + '@example.com'
      expect(user).not_to be_valid
    end

    it 'is not valid with an invalid email format' do
      invalid_emails = %w[user@example,com user_at_example.com user@example.]
      invalid_emails.each do |email|
        user.email = email
        expect(user).not_to be_valid
      end
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with a password that is too short' do
      user.password = '1234'
      expect(user).not_to be_valid
    end

    it 'is not valid with a password that is too long' do
      user.password = 'a' * 17
      expect(user).not_to be_valid
    end

    it 'returns true when password matches' do
      password = 'password123'
      expect(user.authenticate(password)).to be true
    end

    it 'returns false when password does not match' do
      password = 'wrongpassword'
      expect(user.authenticate(password)).to be false
    end

    it 'is not valid when password and password_confirmation do not match' do
      user.password_confirmation = 'mismatch'
      expect(user).not_to be_valid
    end
  end
