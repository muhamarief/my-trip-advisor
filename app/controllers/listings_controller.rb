class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @latitude = @listing.outlet.latitude
    @longitude = @listing.outlet.longitude
  end
end
