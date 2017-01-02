#The controller is for rental information which is held by the administrator
#All function was not necessary for the rental information

class AdminrentalsController < ApplicationController
	
	#This function just get all current information in the database
	def index 
		@rentals = Rental.all
	end

	#This function is used to edit rental content using the identify
	def edit
		#Get the rental id
		@rental = Rental.find(params[:id])
		#Get all current film data in the database
		@films = Film.all
	end
	
	#This function is used to show extra information of a rental data using an identify
	def show
		#Gets the current id of the rental order
		@rental = Rental.find(params[:id])
	end

	#This function is used to update exisiting information
	def update
		#Get the current rental id
		@rental = Rental.find(params[:id])
		#Update the information only if the it was successful
  		if @rental.update(rental_params)
    		redirect_to '/adminrentals'
  		else
  			#Otherwise, render the edit interface
    		render 'edit'
  		end
	end

	#This function is used to delete existing information in the database
	def destroy
		#Get the rental id
  		@rental = Rental.find(params[:id])
  		#Delete that row information
  		@rental.destroy
  		#Redirect back to the rental interface
	  	redirect_to '/adminrentals'
	end

	#The create and new methods was not used.
	def create
	end
	def new
	end

   #These methods are set private
	private
	#This function is used to perform database interaction with all data content in the database
    #For example, updating current information
  def rental_params
    params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus)
  end
end
