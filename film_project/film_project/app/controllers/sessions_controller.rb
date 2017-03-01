#The class is used to log exisitng users to their account page
class SessionsController < ApplicationController
 #Users access this page to sign in
  def new
    @user = User.new
  end

#The create function is used to check if information is right.
    #If so, it will start a session and direct the user to the account page
  def create

    userEmail = User.where(email: params[:email]).count
    userPassword = User.where(password: params[:password]).count

    # if the user exists AND the password entered is correct
    #Then start the session and direct the user to the account page
    if userEmail != 0 && userPassword != 0
      user = User.find_by email: params[:email]
      session[:user_id] = user.id
      redirect_to '/cool'
    else
      @user = Olduser.new
      #If the validation is false then display a error message in the pervious interface
      if @user.valid? == false 
        @user.errors.messages
        flash[:error] = "Please enter valid information"
        redirect_to :back
      end
    end
  end

  #This function is used to terminiate a session.
  #The function is applied when the user logs out
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
