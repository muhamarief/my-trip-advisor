class User < ApplicationRecord

  has_secure_password

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, presence: true

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
      user.password_confirmation = user[:password]
    end
  end

end
