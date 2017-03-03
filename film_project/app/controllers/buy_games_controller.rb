#The class is used to allow users to buy games

class BuyGamesController < ApplicationController

  #This function gets all purchased games of a user
  def index
  	@buyGames = BuyGame.where(user_id: current_user.id)
    @buyAmount = BuyGame.where(user_id: current_user.id).count
  end

  #This function gets information of a game
  def show
  	@buyGames = BuyGame.find(params[:id])
  end

  #This function is used to buy new games
  def new
  	@buyGame = BuyGame.new
    @gamePurchase = Game.all
  end

  #This function is used to purchase a game
  def create
  	@buyGame = BuyGame.new(buy_games_params)
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
