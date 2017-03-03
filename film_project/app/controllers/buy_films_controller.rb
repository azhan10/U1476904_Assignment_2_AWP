#The class is used to allow users to buy films
class BuyFilmsController < ApplicationController
		#This function gets all current film and allows users to purchase films
	def new
		@buyFilms = BuyFilm.new
		@films = Film.all
	end

	#This function is used to display all purchased films (of a user)
	def index
		 @buyFilms = BuyFilm.where(user_id: current_user.id)
		  @filmAmount = BuyFilm.where(user_id: current_user.id).count
	end

	#This is used to show all current purchased films (of a user)
	def show
		@buyFilms = BuyFilm.find(params[:id])
	end

	#The is used to allow users to purchase a film
	def create
 	 @buyFilms = BuyFilm.new(buy_params)
  		if @buyFilms.save
   		 redirect_to '/buy_films'
 		else
   		 render 'new'
  		end
	end

private
  #This is used to get all column data of the database table
  def buy_params
    params.require(:buy_film).permit(:filmtitle, :filmprice, :paymenttype, :user_id)
  end
end
