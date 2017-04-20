class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def create
  end

  def index
    @listings = Listing.all
  end
  
end
