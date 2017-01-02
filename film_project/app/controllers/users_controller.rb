#Thsi class is used to view current user accounts stored in the database

class UsersController < ApplicationController
  #User access this page to sign up
	def new
    @user = User.new
  end

  #The create function is used to start a session and direct hte user to the account page
   def create
    @user = User.new(user_params)
    #If admin is correct, then start the session
    if @user.save
      session[:user_id] = @user.id
       #And direct the user to account page
      redirect_to '/cool'
    else
      #Otherwise, return back error messages in the new interface
      @user = Newuser.new
      @user.valid? 
      @user.errors.messages
      render 'new'
    end
  end

#These are private methods
private
  #The method is used to perform several database interaction.
  def user_params
    params.require(:user).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  end
end
