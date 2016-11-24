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
		if params[:password].blank?
			flash[:error] = "Password is not mentioned"
			redirect_to edit_login_path(@user)
		elsif  params[:salt].blank?
			flash[:error] = "Retype Password is not mentioned"
			redirect_to edit_login_path(@user)
		elsif  params[:firstname].blank?
			flash[:error] = "First name is not mentioned"
			redirect_to edit_login_path(@user)
		elsif  params[:secondname].blank?
			flash[:error] = "Second name is not mentioned"
			redirect_to edit_login_path(@user)
		elsif  params[:address].blank?
			flash[:error] = "Address is not mentioned"
			redirect_to edit_login_path(@user)
		elsif  params[:postcode].blank?
			flash[:error] = "Post code is not mentioned"
			redirect_to edit_login_path(@user)
		else
  			if @user.update(account_params)
    			redirect_to '/cool'
  			else
  				flash[:error] = "Something went wrong"
    			render 'edit'
  			end
  		end
	end

	private
		def account_params
    		params.require(:user).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  		end
end
