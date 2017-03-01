#Thsi class is used to view current user accounts stored in the database

class AdminuserController < ApplicationController
	#Thsi function is used to get all users in the database
	def index
		@adminusers = User.all
	end

	#This function is used to delete current users account that are not administrators
	def destroy
  		@adminusers = User.find(params[:id])
  		@adminusers.destroy
	  	redirect_to '/adminuser'
	end
end
