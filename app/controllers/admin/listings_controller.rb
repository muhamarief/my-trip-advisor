 class Admin::ListingsController < ApplicationController
  layout 'admin'
  include AdminsHelper

  def new
    @listing = Listing.new
    @outlet = Outlet.find(params[:outlet_id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.admin_id = current_admin.id
    @listing.outlet_id = params[:outlet_id]
    if @listing.save
      @outlet = @listing.outlet
      redirect_to admin_outlet_listings_path(@listing.outlet)
    else
      render :new
    end
  end

  def index
    @outlet = Outlet.find(params[:outlet_id])
    @listings = Listing.where(outlet_id: @outlet.id)
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
    params.require(:listing).permit(:item_name, :description, :type_id, :admin_id, :outlet_id)
  end

end
