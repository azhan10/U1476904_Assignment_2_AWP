class AdminsSessionsController < ApplicationController
	  def new
      @admin = Admin.new
    end

  def create
    admin = Admin.find_by_email(params[:email])
    # if the admin exists AND the password entered is correct
    if admin && admin.authenticate(params[:password])
      # save the admin id inside the browser cookie. This is how we keep the admin logged in when they navigate around our website.
      session[:admin_id] = admin.id
      redirect_to '/adminCool'
    else
      @admin = Oldadmin.new
      if @admin.valid? == false
        @admin.errors.messages
        flash[:error] = "Login detials is incorrect"
        redirect_to :back
      end
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/adminlogin'
  end
end
