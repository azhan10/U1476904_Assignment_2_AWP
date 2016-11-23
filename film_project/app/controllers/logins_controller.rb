class LoginsController < ApplicationController
  before_filter :authorize

  def index
		@rentals = Rental.where(user_id: current_user.id).limit(5)
		@buys = Buy.where(user_id: current_user.id).limit(5)
		@users = User.where(id: current_user.id)
	end 

	def destroy
		@user = User.find(params[:id])
  		@user.destroy
	  	redirect_to '/logout'
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
  		if @user.update(account_params)
    		redirect_to '/cool'
  		else
    		render 'edit'
  		end
	end

	private
		def account_params
			@user.password = params[:user][:password_digest]
    		params.require(:user).permit(:name, :email, @user.password, :salt, :firstname, :secondname, :address, :postcode)
  		end
end
