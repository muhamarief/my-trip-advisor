class ChangeListingReference < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :subject_id
    add_reference :listings, :type
  end
end
