class WelcomeController < ApplicationController
  include UsersHelper

  def index
    @user = current_user
    @q = Listing.ransack(params[:q])
    if params[:q]
      @listings = @q.result
    else
      @listings = Listing.all
    end
    @customer_review_new = CustomerReview.new
  end

end
