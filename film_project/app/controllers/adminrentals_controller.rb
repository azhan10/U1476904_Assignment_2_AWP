class AdminrentalsController < ApplicationController
	
	def index 
		@rentals = Rental.all
	end

	def edit
		@rental = Rental.find(params[:id])
		@films = Film.all
	end
	
	def show
		@rental = Rental.find(params[:id])
	end

	def update
		@rental = Rental.find(params[:id])
  		if @rental.update(rental_params)
    		redirect_to '/adminrentals'
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@rental = Rental.find(params[:id])
  		@rental.destroy
	  	redirect_to '/adminrentals'
	end

	def create
	end

	def new
	end


	private
  def rental_params
    params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus)
  end


end
