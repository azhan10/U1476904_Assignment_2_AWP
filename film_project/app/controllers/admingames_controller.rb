class AdmingamesController < ApplicationController

  #The show function is used to get all information of a game such as the platform
  def show
	 @admingames = Game.find(params[:id])
   @reviewAmount = Gamereview.where(game_id: @admingames).count
  end

  #It handles the operation of adding new game data to the database
  def new
  	@admingame = Game.new
  end


  #The edit funtion is used to edit information of a game
  def edit
  	@admingame = Game.find(params[:id])
  end

#This function is used to create a new row of game data to the database
  def create
  	@admingame = Game.new(admingame_params)
  	if @admingame.save
   	 redirect_to '/adminCool'
 	else
   	 render 'new'
  	end
  end

  #The update function performs the operation of updating information of a game in the database
  def update
    @admingame = Game.find(params[:id])
      if @admingame.update(admingame_params)
        redirect_to '/adminCool'
      else
        render 'edit'
      end
  end

#This function is used to delete a game information in the database
  def destroy
    @admingame = Game.find(params[:id])
      @admingame.destroy
      redirect_to '/adminCool'
  end

  private
  #This function is used to perform database interaction with all data content in the database
   def admingame_params
    params.require(:game).permit(:gametitle, :gameDescription, :gamerating, :gamegenre, :platform)
   end
end
