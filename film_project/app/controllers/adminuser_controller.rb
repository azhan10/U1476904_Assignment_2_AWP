class AdminuserController < ApplicationController
	def index
		@adminusers = User.all
	end

	def destroy
  		@adminusers = User.find(params[:id])
  		@adminusers.destroy
	  	redirect_to '/adminuser'
	end
end
