class AdminsLoginController < ApplicationController
	before_filter :authorizeAdmin

	def index
		@rentals = Rental.all
	end 
end
