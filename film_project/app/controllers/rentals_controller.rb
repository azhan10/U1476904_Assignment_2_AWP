#The controller is for rental information which is held by the user
#All actions was applied to this interface

class RentalsController < ApplicationController

	#This function just get all users rentals in the database
	def index
		@rentals = Rental.where(user_id: current_user.id)
		@rentalsAmount = Rental.where(user_id: current_user.id).count
	end

	#This function is used to rent a new film.
	#The function is used to get all current films and add new content to the rental database
	def new
		@films = Film.all
		@rental = Rental.new
	end

	#This action is used to create new row of data in the database
	def create
		#Call the rental_params method
		@rental = Rental.new(rental_params)
		#Save information (if successfull) or render new interface (if save fails)
    	if @rental.save
					flash[:success] = 'Rental is reserved'
      		redirect_to '/rentals'
    	else
      		render 'new'
    	end
	end

	#This function is used to edit rental content using the identify
	def edit
 		@rental = Rental.find(params[:id])
		@films = Film.all
	end

	#This is used to update exisiting data from the database
	def update
		@rental = Rental.find(params[:id])
		#Update information (if successfull) or render edit interface (if update fails)
    if @rental.update(rental_params)
        redirect_to '/rentals'
      else
        render 'edit'
      end
	end

	#The show function is used to view all data of a rental film
	def show
    	@rental = Rental.find(params[:id])
  	end

  	#The destroy function is used to delete an existing rental information
	def destroy
  		@rental = Rental.find(params[:id])
  		@rental.destroy
	  	redirect_to '/rentals'
	end

	private
	#This function is used to perform database interaction with all data content in the database
    #For example, updating current information
  	def rental_params
    	params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus, :user_id, :username)
  	end
end
