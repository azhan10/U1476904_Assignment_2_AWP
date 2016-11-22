class AdminsSessionsController < ApplicationController
	  def new
  end

  def create
    admin = Admin.find_by_email(params[:email])
    # if the admin exists AND the password entered is correct
    if admin && admin.authenticate(params[:password])
      # save the admin id inside the browser cookie. This is how we keep the admin logged in when they navigate around our website.
      session[:admin_id] = admin.id
      redirect_to '/adminCool'
    else
      redirect_to '/adminlogin'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/adminlogin'
  end
end
