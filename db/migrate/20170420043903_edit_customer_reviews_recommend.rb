class EditCustomerReviewsRecommend < ActiveRecord::Migration[5.0]
  def change
    remove_column :customer_reviews, :recommend
    add_column :customer_reviews, :recommend, :boolean, :default => false
  end
end
