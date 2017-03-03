class ApplicationController < ActionController::Base
  #This is used to make the account system secure as possible
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  #if customer session exists; then direct to the website
  def authorize
    redirect_to '/login' unless current_user
  end

  def admin_user
    @admin_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :admin_user

  #if admin session exists; then direct to the website
  def authorizeAdmin
    redirect_to '/adminlogin' unless admin_user
  end
end
