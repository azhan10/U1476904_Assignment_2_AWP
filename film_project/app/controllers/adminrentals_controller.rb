class AdminrentalsController < ApplicationController
	
	#This function just get all current information in the database
	def index 
		@rentals = Rental.all
	end

	#This function is used to edit rental content and view selected film's information
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
    		render 'edit'
  		end
	end

	#This function is used to delete existing information in the database
	def destroy
  		@rental = Rental.find(params[:id])
  		@rental.destroy
	  	redirect_to '/adminrentals'
	end

	private
	#This function is used to perform database interaction with all data content in the database such as editing
  def rental_params
    params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus)
  end
end
