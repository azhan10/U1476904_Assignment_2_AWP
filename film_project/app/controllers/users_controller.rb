#This class is used to register a user

class UsersController < ApplicationController
  #User access this page to sign up
	def new
    @user = User.new
  end

  #The create function is used to register the information and log the user into their account
   def create
    @user = User.new(user_params)
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
