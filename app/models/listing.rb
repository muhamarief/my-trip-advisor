class Listing < ApplicationRecord

  belongs_to :admin
  belongs_to :type
  belongs_to :booking_item
  belongs_to :subscribe_item
  belongs_to :purchase_item
  belongs_to :outlet

  has_many :customer_reviews

  validates :admin_id, presence: true
  validates :type_id, presence: true
  validates :item_name, presence: true

end
