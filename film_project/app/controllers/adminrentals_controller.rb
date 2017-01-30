#All function was not necessary for the rental information

class AdminrentalsController < ApplicationController
	
	#This function just get all current information in the database
	def index 
		@rentals = Rental.all
	end

	#This function is used to edit rental content using the identify
	#It also get information from the database system
	def edit
		@rental = Rental.find(params[:id])
		@films = Film.all
	end
	
	#This function is used to show extra information of a rental data using an identify
	def show
		@rental = Rental.find(params[:id])
	end

	#This function is used to update exisiting information
	def update
		@rental = Rental.find(params[:id])
  		if @rental.update(rental_params)
    		redirect_to '/adminrentals'
  		else
  			#If fails, render the edit interface
    		render 'edit'
  		end
	end

	#This function is used to delete existing information in the database
	def destroy
  		@rental = Rental.find(params[:id])
  		@rental.destroy
	  	redirect_to '/adminrentals'
	end

	#The create and new methods was not used.
	def create
	end
	def new
	end

	private
	#This function is used to perform database interaction with all data content in the database
    #For example, updating current information
  def rental_params
    params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus)
  end
end
