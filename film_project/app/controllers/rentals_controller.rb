#The controller is for rental information which is held by the user
#All actions was applied to this interface

class RentalsController < ApplicationController

	#This function just get all users rentals in the database
	def index
		@rentals = Rental.where(user_id: current_user.id)
	end

	#This function is used to rent a new film.
	#The function is used to get all current films and add new content to the rental database
	def new
		#Get all films
		@films = Film.all
		#Is used to add new rental films
		@rental = Rental.new
	end

	#This action is used to create new row of data in the database
	def create
		#Call the rental_params method
		@rental = Rental.new(rental_params)
    	#If the save was successful, then direct to the rental interface
    	if @rental.save
      		redirect_to '/rentals'
    	else
    		#Otherwise, render the new interface
      		render 'new'
    	end
	end

	#This function is used to edit rental content using the identify
	def edit
		#Get rental id
 		@rental = Rental.find(params[:id])
 		#Get all film information
		@films = Film.all
	end

	#This is used to update exisiting data from the database
	def update
		#Get current rental id
		@rental = Rental.find(params[:id])
		#If the information is updated
    if @rental.update(rental_params)
    	#Direct the user to rental interface
        redirect_to '/rentals'
      else
      	#Otherwise, render the edit interface
        render 'edit'
      end
	end

	#The show function is used to view all data of a rental film
	def show
    	@rental = Rental.find(params[:id])
  	end

  	#The destroy function is used to delete an existing rental information
	def destroy
		#Get rental id
  		@rental = Rental.find(params[:id])
  		#Delete the row
  		@rental.destroy
  		#Direct the user to rentals index interface
	  	redirect_to '/rentals'
	end

	#These methods are set private
	private
	#This function is used to perform database interaction with all data content in the database
    #For example, updating current information
  	def rental_params
    	params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus, :user_id)
  	end
end
