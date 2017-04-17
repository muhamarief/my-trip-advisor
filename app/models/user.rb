class User < ApplicationRecord

  has_secure_password

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, presence: true

end
