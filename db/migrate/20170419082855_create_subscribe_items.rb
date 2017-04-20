class CreateSubscribeItems < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribe_items do |t|
      t.integer :capacity, null: false
      t.integer :capacity_count, null: false
      t.integer :subscribe_duration, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
