#The class is used to allow users to buy films
class BuysController < ApplicationController

	#The new function gets all current film information and create new film purchase data
	def new
		#This line of code is used to add new data content to the buy film database table
		@buy = Buy.new
		#This line of code passes all current film data in the database
		@films = Film.all
	end

	#This function is used to display all current film purchase which matches to the user id
	def index
		#Gets all film purchase of the account hoder.
		 @buys = Buy.where(user_id: current_user.id)
	end

	#This is used to show all data of film purchase using the film identifier
	def show
		@buys = Buy.find(params[:id])
	end

	#The create function is used to add new data content 
	def create
 	 @buy = Buy.new(buy_params)
 	 #If the buy data is saved, then it will direct the user to the buy interface
  		if @buy.save
   		 redirect_to '/buys'
 		else
 		#Otherwise, render the new interface
   		 render 'new'
  		end
	end

  #This function (below) is private
private
  #This is used to get all column data of the database table
  def buy_params
    params.require(:buy).permit(:filmtitle, :filmprice, :paymenttype, :user_id)
  end
end
