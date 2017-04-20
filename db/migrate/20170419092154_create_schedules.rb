class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :booking_item, null: false
      t.datetime :started_at, null: false
      t.datetime :finished_at, null: false
      t.integer :slot, null: false
      t.integer :booking_count, default: 0, null: false

      t.timestamps
    end
  end
end
