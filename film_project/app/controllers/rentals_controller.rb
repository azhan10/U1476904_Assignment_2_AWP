class RentalsController < ApplicationController

	def index
		@rentals = Rental.where(user_id: current_user.id)
	end

	def new
		@films = Film.all
		@rental = Rental.new
	end

	def create
		@rental = Rental.new(rental_params)
    if @rental.save
      redirect_to '/rentals'
    else
      render 'new'
    end
	end

	def edit
 	@rental = Rental.find(params[:id])

	end

	def update
		@rental = Rental.find(params[:id])
    if @rental.update(rental_params)
        redirect_to '/rentals'
      else
        render 'edit'
      end
	end


	def show
    @rental = Rental.find(params[:id])
  end


	def destroy
  		@rental = Rental.find(params[:id])
  		@rental.destroy
	  	redirect_to '/rentals'
	end

	private
  def rental_params
    params.require(:rental).permit(:filmtitle, :filmduration, :rentalstatus, :user_id)
  end
end
