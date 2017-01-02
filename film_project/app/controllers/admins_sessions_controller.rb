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
    admin = Admin.find_by_email(params[:email])
    # if the admin exists AND the password entered is correct
    if admin && admin.authenticate(params[:password])
      # save the admin id inside the browser cookie. This is how we keep the admin logged in when they navigate around our website.
      session[:admin_id] = admin.id
      redirect_to '/adminCool'
    else
      #This is used for validation reasons
      @admin = Oldadmin.new
      #If the validation is false then display a error message in the pervious interface
      if @admin.valid? == false
        @admin.errors.messages
        flash[:error] = "Login detials is incorrect"
        redirect_to :back
      end
    end
  end
  
  #This function is used to terminiate a session.
  #The function is applied when the user logs out
  def destroy
    session[:admin_id] = nil
    redirect_to '/adminlogin'
  end
end
