class WelcomeController < ApplicationController
  include UsersHelper

  def index
    @user = current_user
    @listings = Listing.all
    @customer_review_new = CustomerReview.new
  end

end
