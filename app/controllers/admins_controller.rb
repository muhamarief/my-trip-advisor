class AdminsController < ApplicationController
  layout 'admin'
  include AdminsHelper

  def new
    if admin_logged_in? && current_admin.super_admin
      @admin = Admin.new
    end
  end

  def index
    @admins = Admin.all
    # @q = Admin.ransack(params[:q])
    # @q.sorts = 'id' if @q.sorts.empty?
    # # @admins = paginate @q.result(distinct: true)
    # @admins = @q.result(distinct: true).paginate(:page => params[:page])
  end

  def create
    if current_admin.super_admin
      @admin = Admin.create!(admin_params)
      redirect_to admins_path
    else
      render template: "/unauthorize/show"
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if current_admin.super_admin
      @admin.update(admin_params)
      redirect_to admins_path
    else
      render template: "/unauthorize/show"
    end
  end

  def destroy
    unless (current_admin == super_authorization)
      @admin.destroy
      redirect_to root_path
    else
      render template: "/unauthorize/show"
    end
  end

  private
    def admin_params
      if current_admin.super_admin
        params.require(:admin).permit(
          :username,
          :email,
          :password,
          :password_confirmation,
          :super_admin
        )
      end
    end
end
