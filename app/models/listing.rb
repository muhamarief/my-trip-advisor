class Listing < ApplicationRecord

  belongs_to :admin
  belongs_to :type
  belongs_to :booking_item
  belongs_to :subscribe_item
  belongs_to :purchase_item

  has_many :customer_reviews

end
