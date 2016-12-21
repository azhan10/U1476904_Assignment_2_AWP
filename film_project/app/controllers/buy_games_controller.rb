class BuyGamesController < ApplicationController
  def index
  	@buyGames = BuyGame.where(user_id: current_user.id)
  end

  def show
  	@buyGames = BuyGame.find(params[:id])
  end

  def new
  	@buyGame = BuyGame.new
    @gamePurchase = Game.all
  end

  def create
  	@buyGame = BuyGame.new(buy_games_params)
   
      if @buyGame.save
       redirect_to buy_games_index_path
      else
       render 'new'
      end
  end

  private
  def buy_games_params
    params.require(:buy_game).permit(:gametitle, :gameprice, :platform, :paymenttype, :user_id)
  end
end
