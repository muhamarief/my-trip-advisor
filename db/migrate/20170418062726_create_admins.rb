class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string  :username
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.integer :sign_in_count, default: 0, null: false
      t.boolean :super_admin, default: false
      t.datetime  :last_sign_in

      t.timestamps
    end
  end
end
