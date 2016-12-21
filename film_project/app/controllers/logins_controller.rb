class LoginsController < ApplicationController
  before_filter :authorize

  def index
		@rentals = Rental.where(user_id: current_user.id).limit(5)
		@buys = Buy.where(user_id: current_user.id).limit(5)
		@users = User.where(id: current_user.id)
		@buyGames = BuyGame.where(user_id: current_user.id).limit(5)
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
		@user = Edituser.find(params[:id])
     	@user.valid? 
     	@user.errors.messages
  		if @user.update(account_params)
    		redirect_to '/cool'
  		else
  			flash[:error] = 'Please enter all content'
    		redirect_to :back
  		end
	end

	private
		def account_params
    		params.require(:user).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  		end
end
