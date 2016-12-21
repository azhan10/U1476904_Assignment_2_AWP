class AdmingamesController < ApplicationController
  def show
	@admingames = Game.find(params[:id])
  end

  def new
  	@admingame = Game.new
  end

  def edit
  	@admingame = Game.find(params[:id])
  end

  def create
  	@admingame = Game.new(admingame_params)
  	if @admingame.save
   	 redirect_to '/adminCool'
 	else
   	 render 'new'
  	end
  end

  def update
    @admingame = Game.find(params[:id])
      if @admingame.update(admingame_params)
        redirect_to '/adminCool'
      else
        render 'edit'
      end
  end

  def destroy
    @admingame = Game.find(params[:id])
      @admingame.destroy
 
      redirect_to '/adminCool'
  end

  private
  		def admingame_params
    		params.require(:game).permit(:gametitle, :gameDescription, :gamerating, :gamegenre, :platform)
  		end
end
