class AdminsSessionsController < ApplicationController
  #Administrator access this page to sign in
	  def new
      @admin = Admin.new
    end

    #This functions logs a administrator if information is right
    #This will start a session
  def create
    adminEmail = Admin.where(email: params[:email]).count
    adminPassword = Admin.where(password: params[:password]).count
    if adminEmail != 0 && adminPassword != 0
      admin = Admin.find_by email: params[:email]
      session[:admin_id] = admin.id
      redirect_to '/adminCool'
    else
      @admin = Oldadmin.new
      if @admin.valid? == false
        @admin.errors.messages
        flash[:error] = "Please fill in valid information"
        redirect_to :back
      end
    end
  end
  
  #This function is used to terminiate a session and direct the user back to the admin login page
  def destroy
    session[:admin_id] = nil
    redirect_to '/adminlogin'
  end
end
