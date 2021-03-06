 class Admin::ListingsController < ApplicationController
  layout 'admin'
  include AdminsHelper
  before_action :require_login_admin

  def new
    @listing = Listing.new
    @outlet = Outlet.find(params[:outlet_id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.admin_id = current_admin.id
    @listing.outlet_id = params[:outlet_id]
    @outlet = Outlet.find(params[:outlet_id])
    if @listing.save
      redirect_to admin_outlet_listings_path(@outlet)
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

  def require_login_admin
    unless admin_logged_in?
      flash[:error] = "You dont have access to this page"
      redirect_to new_auth_admin_path # halts request cycle
    end
  end

end
