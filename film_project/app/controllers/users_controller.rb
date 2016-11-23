class UsersController < ApplicationController
	def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/cool'
    else
      user = User.new
      user.valid? 
      user.errors.messages
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :salt, :firstname, :secondname, :address, :postcode)
  end
end
