#The controller is for customer's rental information

class RentalsController < ApplicationController

	#This function just get all users rentals in the database
	def index
		@rentals = Rental.where(user_id: current_user.id)
		@rentalsAmount = Rental.where(user_id: current_user.id).count
	end

	#This function is used to rent a new film.
	def new
		@films = Film.all
		@rental = Rental.new
	end

	#This action is used to create new row of data in the database
	def create
		@rental = Rental.new(rental_params)
    	if @rental.save
					flash[:success] = 'Rental is reserved'
      		redirect_to '/rentals'
    	else
      		render 'new'
    	end
	end

	#This function is used to edit current film rentals
	def edit
 		@rental = Rental.find(params[:id])
		@films = Film.all
	end

	#This is used to update exisiting rental information in the database
	def update
		@rental = Rental.find(params[:id])
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
	#Used to perform database interactions such as their film title
  	def rental_params
    	params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus, :user_id, :username)
  	end
end
