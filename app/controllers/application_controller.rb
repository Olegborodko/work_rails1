class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :current_admin
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
end