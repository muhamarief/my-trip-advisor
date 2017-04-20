class WelcomeController < ApplicationController
  include UsersHelper

  def index
    @user = current_user
    # @listings = Listing.all
    @q = Listing.ransack(params[:q])
    @listings = @q.result(distinct: true)
    @customer_review_new = CustomerReview.new

  end

end
