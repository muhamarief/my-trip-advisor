class CustomerReviewsController < ApplicationController
  include UsersHelper

  def create
    if params[:customer_review][:recommend]
      @customer_review = CustomerReview.new(customer_review_params)
      @customer_review.listing_id = params["listing_id"]
      @customer_review.user_id = current_user.id
      if @customer_review.save
        @value = @customer_review.recommend
        render :json => @value.to_json
      else
        redirect_to root_path
      end
    end
  end

  def update
    @listing = CustomerReview.find(params[:id]).listing
    @customer_review = CustomerReview.find_by(user_id: current_user.id, listing_id: @listing.id)
    if @customer_review.update(customer_review_params)
      @update_recommend = @customer_review
      render template: '/welcome/_recommend_form', layout: false
      # render :json => @value.to_json
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private
  def customer_review_params
    params.require(:customer_review).permit(:listing_id,
                                            :rating,
                                            :comment,
                                            :recommend)
  end
end
