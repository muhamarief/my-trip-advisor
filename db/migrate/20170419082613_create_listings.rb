class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :admin
      t.references :subject
      t.string :item_name
      t.text :description
      t.references :booking_item
      t.references :subscribe_item
      t.references :purchase_item
      t.json :photos

      t.timestamps
    end
  end
end
