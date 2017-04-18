class AdminsController < ApplicationController

  def index
    # @q = Admin.ransack(params[:q])
    # @q.sorts = 'id' if @q.sorts.empty?
    # @admins = paginate @q.result(distinct: true)
    #
    # respond_with @admins
  end

  def create
    # if (current_authenticatee.super_admin)
    #   @admin = Admin.create!(admin_params)
    #   respond_with @admin, status: :created
    # else
    #   render_unauthorized
    # end
  end

  def show
    # respond_with @admin
  end

  def update
    # @admin.assign_attributes(admin_params)
    # if current_authenticatee == @admin and @admin.super_admin_changed?
    #   render_unprocessable_entity("Can not modify super admin value of your own account")
    # else
    #   @admin.save
    #   respond_with @admin
    # end
  end

  def destroy
    # unless (current_authenticatee.id == @admin.id)
    #   @admin.delete
    #   head 204
    # else
    #   render_unprocessable_entity("Can not delete your own account")
    # end
  end

  def show_me
    # @admin = current_authenticatee
    # respond_with @admin
  end

  def update_me
    # @admin = current_authenticatee
    # @admin.assign_attributes(admin_params)
    # if @admin.super_admin_changed?
    #   render_unprocessable_entity("Can not modify super admin value of your own account")
    # else
    #   @admin.save
    #   respond_with @admin
    # end
  end

  private
    def set_admin
      # @admin = Admin.find(params[:id])
    end

    def admin_params
      # if (current_authenticatee.super_admin)
      #   params.permit(
      #     :name,
      #     :email,
      #     :password,
      #     :password_confirmation,
      #     :super_admin
      #   )
      # else
      #   params.permit(
      #     :name,
      #     :email,
      #     :password,
      #     :password_confirmation
      #   )
      # end
    end
end
