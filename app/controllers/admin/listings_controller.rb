 class Admin::ListingsController < ApplicationController
  layout 'admin'
  include AdminsHelper

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.admin_id = current_admin.id
    if @listing.save
      redirect_to admin_listings_path
    else
      render :new
    end
  end

  def index
    @listings = Listing.all
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to edit_admin_listing_path(@listing), notice: "Updated"
    else
      render :edit
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:item_name, :description, :type_id, :admin_id)
  end

end
