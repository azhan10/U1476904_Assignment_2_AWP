#The class is used to log exisitng administrator users to their account page
class AdminsSessionsController < ApplicationController
  #Administrator access this page to sign in
	  def new
      @admin = Admin.new
    end

    #The create function is used to check if information is right.
    #If so, it will start a session and direct the user to the account page
  def create
    #Get administrator email
    adminEmail = Admin.where(email: params[:email]).count
    adminPassword = Admin.where(password: params[:password]).count
    # if the admin exists AND the password entered is correct, start the session
    if adminEmail != 0 && adminPassword != 0
      admin = Admin.find_by email: params[:email]
      session[:admin_id] = admin.id
      redirect_to '/adminCool'
    else
      #This is used for validation reasons
      @admin = Oldadmin.new
      #If the validation is false then display a error message in the pervious interface
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
