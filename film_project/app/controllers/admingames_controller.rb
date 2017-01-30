#The controller is for game information which is held by the administrator
#The administrator has the privledge to perform the CRUD operations.

class AdmingamesController < ApplicationController

  #The show function is used to get all information of a game.
  #Examples includes the platform
  def show
	 @admingames = Game.find(params[:id])
   @reviewAmount = Gamereview.where(game_id: @admingames).count
  end

#The code below is used for the new interface. 
  #It handles the operation of adding new game data to the database
  def new
  	@admingame = Game.new
  end


  #The edit funtion is used to edit information of a game using the identify
  def edit
  	@admingame = Game.find(params[:id])
  end

#This function is used to create a new row of game data to the database
  def create
    #Get the game id
  	@admingame = Game.new(admingame_params)
    #If save was completed
  	if @admingame.save
      #Direct the user to the home page
   	 redirect_to '/adminCool'
 	else
    #Otherwise, render the new interface
   	 render 'new'
  	end
  end

  #The update function performs the operation of updating information of a game in the database
  def update
    #Get the game id
    @admingame = Game.find(params[:id])
    #If update is successful, then direct back admin home page
      if @admingame.update(admingame_params)
        redirect_to '/adminCool'
      else
        #Otherwise, render the edit interface.
        render 'edit'
      end
  end

#This function is used to delete a game information in the database using a game
  #identify
  def destroy
    #Get the game id
    @admingame = Game.find(params[:id])
    #Delete the game row in the database
      @admingame.destroy
      #Direct administrator to the home page.
      redirect_to '/adminCool'
  end

#These methods are set private
  private
  #This function is used to perform database interaction with all data content in the database
  #For example, updating current information
   def admingame_params
    params.require(:game).permit(:gametitle, :gameDescription, :gamerating, :gamegenre, :platform)
   end
end
