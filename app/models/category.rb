class Category < ApplicationRecord
  has_many :types

  validates :name, presence: true
end
