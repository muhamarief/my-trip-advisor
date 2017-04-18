class Admin < ApplicationRecord

  has_secure_password

  validates :email, :username, :password_digest, :password_confirmation, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { in: 6..20 }


end
