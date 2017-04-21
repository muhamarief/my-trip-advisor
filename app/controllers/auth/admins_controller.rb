class Auth::AdminsController < ApplicationController
  layout 'admin'
  include AdminsHelper

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      admin.set_after_login
      redirect_to admin_outlets_path, notice: 'Logged In!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

end
