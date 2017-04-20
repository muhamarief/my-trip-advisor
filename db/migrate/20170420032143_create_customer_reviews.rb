class CreateCustomerReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_reviews do |t|
      t.references :user, null: false
      t.references :listing, null: false
      t.decimal :rating
      t.string :comment
      t.boolean :recommend

      t.timestamps
    end
  end
end
