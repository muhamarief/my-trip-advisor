class SessionsController < ApplicationController

  def new_user
    # render :new_user
  end

  def new_admin
    # render :new_admin
  end

  def create_facebook_omniauth
    # with facebook
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def create
    # withouth facebook user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged In!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def create_admin
    # withouth facebook admin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged In!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

end
