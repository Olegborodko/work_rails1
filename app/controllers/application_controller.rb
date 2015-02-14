class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_admin_session_url
  end

  helper_method :current_user, :current_admin, :current_ability
  
  private

  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end


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