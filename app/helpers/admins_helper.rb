module AdminsHelper

  private
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def admin_logged_in?
    true unless current_admin.nil?
  end
end
