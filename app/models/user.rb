class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,

            uniqueness: { case_sensitive: false },

            length: { maximum: 105 },

            format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true,
            length: { minimum:5, maximum: 16 }

  validate :password_matches_confirmation

  def authenticate(password)
    return true if self.password == password
  end

  private

  def password_matches_confirmation
    if password != password_confirmation
      errors.add(:password, " must match password confirmation")
    end
  end
end