class CreatePurchaseItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_items do |t|
      t.integer :quantity, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
