class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :current_admin
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authorize
		redirect_to root_url, alert: "Not authorized" if current_admin.nil?
	end
end