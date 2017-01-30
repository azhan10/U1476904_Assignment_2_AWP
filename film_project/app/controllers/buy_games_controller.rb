#The class is used to allow users to buy games

class BuyGamesController < ApplicationController

  #This function gets all games what matches the account holder identify
  def index
  	@buyGames = BuyGame.where(user_id: current_user.id)
    @buyAmount = BuyGame.where(user_id: current_user.id).count
  end

  #This function gets adn display all data in the database to the interface
  def show
  	@buyGames = BuyGame.find(params[:id])
  end

  #This function is used to buy new games
  def new
  	@buyGame = BuyGame.new
    @gamePurchase = Game.all
  end

  #The create function is used to buy a new game and add the data to the database
  def create
  	@buyGame = BuyGame.new(buy_games_params)
    #Save information (if successfull) or abort (if fails)
      if @buyGame.save
       redirect_to buy_games_index_path
      else
       render 'new'
      end
  end

  private
  #This is used to get all column data of the database table
  def buy_games_params
    params.require(:buy_game).permit(:gametitle, :gameprice, :platform, :paymenttype, :user_id)
  end
end
