class CreateBookingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_items do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :duration_in_minutes, null: false
      t.integer :last_order_in_minutes, null: false
      t.decimal :price, null: false
      t.decimal :slot_fee, null: false

      t.timestamps
    end
  end
end
