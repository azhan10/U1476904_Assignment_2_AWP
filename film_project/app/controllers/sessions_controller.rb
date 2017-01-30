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
    if userEmail != 0 && userPassword != 0
      user = User.find_by email: params[:email]
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/cool'
    else
      #This is used for validation reasons
      @user = Olduser.new
      #If the validation is false then display a error message in the pervious interface
      if @user.valid? == false 
        @user.errors.messages
        flash[:error] = "Login details is incorrect"
        redirect_to :back
      end
    end
  end

  #This function is used to terminiate a session.
  #The function is applied when the user logs out
  def destroy
    #Make the session is null
    session[:user_id] = nil
    #Direct the user to login page
    redirect_to '/login'
  end
end
