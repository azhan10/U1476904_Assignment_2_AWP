#The controller is used to check if theres a administrator or user session
class ApplicationController < ActionController::Base
  #This is used to make the account system secure as possible
  protect_from_forgery with: :exception
  
  #The two function is used for customers
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  #This is used to direct users to the current customer account page
  #(assuming their an existing customer session)
  def authorize
    redirect_to '/login' unless current_user
  end

  #The two function is used for administrator
  def admin_user
    @admin_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :admin_user

  #This is used to direct users to the current admin account page
  #(assuming their an existing administrator session)
  def authorizeAdmin
    redirect_to '/adminlogin' unless admin_user
  end
end
