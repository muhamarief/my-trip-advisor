class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password] == params[:user][:password_confirmation]
      if @user.save
        redirect_to root_path, notice: "Thank you for joining us"
      else
        render :new
      end
    else
      #password and password_confirmation was not match
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
