#This class is used to view current user information in the database

class UsersController < ApplicationController
  #User access this page to sign up
	def new
    @user = User.new
  end

  #The create function is used to start a session and direct hte user to the account page
   def create
    @user = User.new(user_params)
    #Save information (if successfull) or render new interface (if save fails)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/cool'
    else
      @user.valid? 
      @user.errors.messages
      render 'new'
    end
  end

private
  #The method is used to perform several database interaction.
  def user_params
    params.require(:user).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  end
end
