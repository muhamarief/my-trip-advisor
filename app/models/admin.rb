class Admin < ApplicationRecord

  has_secure_password

  validates :email, :username, :password_digest, :password_confirmation, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { in: 6..20 }

  before_create :set_last_sign_in

  has_many :outlets
  has_many :listings

  def set_last_sign_in
    self.last_sign_in = DateTime.now
  end

  def set_after_login
    self.last_sign_in = DateTime.now
    self.sign_in_count += 1
    self.save
  end

end
