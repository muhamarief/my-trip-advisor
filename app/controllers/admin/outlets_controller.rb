class Admin::OutletsController < ApplicationController
  layout 'admin'
  include AdminsHelper

  def new
    @outlet = Outlet.new
  end

  def create
    @outlet = Outlet.new(outlet_params)
    @outlet.admin_id = current_admin.id
    if @outlet.save
      redirect_to admin_outlets_path
    else
      render :new
    end
  end

  def index
    @outlets = Outlet.all
  end

  def edit
    @outlet = Outlet.find(params[:id])
  end

  def update
  end

  private
  def outlet_params
    params.require(:outlet).permit(:name, :phone_number, :gmap_address, :latitude, :longitude, :admin_id)
  end
end
