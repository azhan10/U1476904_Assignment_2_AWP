#The class is used to allow users to but games
#The class uses most of the action functions

class BuyGamesController < ApplicationController

  #This function gets all games what matches the account holder identify
  def index
  	@buyGames = BuyGame.where(user_id: current_user.id)
    @buyAmount = BuyGame.where(user_id: current_user.id).count
  end

  #This function gets adn display all data in the database to the interface
  def show
    #Get the games identify
  	@buyGames = BuyGame.find(params[:id])
  end

  #This function is used to buy new games
  def new
  	@buyGame = BuyGame.new
    #This is used to get all current games stored in the datavase
    @gamePurchase = Game.all
  end

  #The create function is used to buy a new game and add the data to the database
  def create
    #Trigger this method to get all data
  	@buyGame = BuyGame.new(buy_games_params)
    #If the information was saved
      if @buyGame.save
        #Direct the user back to the index interface
       redirect_to buy_games_index_path
      else
        #Otherwise, render the new interface
       render 'new'
      end
  end

  #This function (below) is private
  private
  #This is used to get all column data of the database table
  def buy_games_params
    params.require(:buy_game).permit(:gametitle, :gameprice, :platform, :paymenttype, :user_id)
  end
end
