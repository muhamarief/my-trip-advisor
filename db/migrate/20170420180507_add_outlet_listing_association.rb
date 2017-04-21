class AddOutletListingAssociation < ActiveRecord::Migration[5.0]
  def change
    add_reference :listings, :outlet, foreign_key: true
  end
end
