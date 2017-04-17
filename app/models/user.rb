class User < ApplicationRecord

  has_secure_password

  validates :email, uniqueness: { message: "Your email has already been taken!"}
  validates :email, presence: { message: "You need to type in an email!"}
  validates :password_digest, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true

end
