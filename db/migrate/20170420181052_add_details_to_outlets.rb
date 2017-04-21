class AddDetailsToOutlets < ActiveRecord::Migration[5.0]
  def change
    add_column :outlets, :detail, :string
  end
end
