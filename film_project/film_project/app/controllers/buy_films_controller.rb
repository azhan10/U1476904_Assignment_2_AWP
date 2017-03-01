#The class is used to allow users to buy films
class BuyFilmsController < ApplicationController
		#The new function gets all current film information and allows users to purchase films
	def new
		@buyFilms = BuyFilm.new
		@films = Film.all
	end

	#This function is used to display all current film purchase which matches to the user id
	def index
		 @buyFilms = BuyFilm.where(user_id: current_user.id)
		  @filmAmount = BuyFilm.where(user_id: current_user.id).count
	end

	#This is used to show all data of film purchase using the film identifier
	def show
		@buyFilms = BuyFilm.find(params[:id])
	end

	#The create function is used to add new data content 
	def create
 	 @buyFilms = BuyFilm.new(buy_params)
 	 #Save information (if successfull) or render the new interface (if fails)
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
