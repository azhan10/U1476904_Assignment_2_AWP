class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end



  def admin_user
    @admin_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :admin_user

  def authorizeAdmin
    redirect_to '/adminlogin' unless admin_user
  end
end
