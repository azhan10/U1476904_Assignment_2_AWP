#Administrator account features (users only)
class AdminuserController < ApplicationController
	#Thsi function is used to get all users in the database
	def index
		@adminusers = User.all
	end

	#This function is used to delete current users account(s)
	def destroy
  		@adminusers = User.find(params[:id])
  		@adminusers.destroy
	  	redirect_to '/adminuser'
	end
end
