class CreateOutlets < ActiveRecord::Migration[5.0]
  def change
    create_table :outlets do |t|
      t.string    :name,  null: false
      t.references :admin, null: false
      t.string    :phone_number
      t.string    :gmap_address, null: false
      t.float     :latitude,  null: false
      t.float     :longitude, null: false

      t.timestamps
    end
  end
end
