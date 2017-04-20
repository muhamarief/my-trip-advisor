class User < ApplicationRecord

  has_secure_password

  validates :email, :username, :password_digest, :password_confirmation, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { in: 6..20 }

  has_many :customer_reviews

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
      user.email = auth["extra"]["raw_info"]["email"]
      user.password = SecureRandom.hex(6)
      user.password_confirmation = user.password
    end
  end

end
