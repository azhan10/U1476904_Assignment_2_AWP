#This class is used to log exisitng users to their account page
class SessionsController < ApplicationController
 #Users access this page to sign in
  def new
    @user = User.new
  end

#The create function is used to log a current holder in (if information is right)
##It warns the user if its wrong
  def create
    userEmail = User.where(email: params[:email]).count
    userPassword = User.where(password: params[:password]).count
    if userEmail != 0 && userPassword != 0
      user = User.find_by email: params[:email]
      session[:user_id] = user.id
      redirect_to '/cool'
    else
      @user = Olduser.new
      if @user.valid? == false 
        @user.errors.messages
        flash[:error] = "Please enter valid information"
        redirect_to :back
      end
    end
  end

  #This function is used to terminiate a session (log out the account holder)
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
