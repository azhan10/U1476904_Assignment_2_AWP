#The class is used to get all game information in the database
#The show function is used here to view more information of a film

class GamesController < ApplicationController
	before_action :set_game, only: [:show]
	  # The index function gets all game information and subdivide the information into pages (30 per page)
	def index
		@games = Game.all.paginate(page: params[:page], per_page: 30)
		@gamesAmount = Game.count

		if params[:search]
      		@games = Game.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
    	else
      		@games = Game.all.order("created_at DESC").paginate(page: params[:page])
    	end
	end

	#This function is not used.
	def show
	end

  #These are private methods
	private
	 #The set game function is used to get game information
	 def set_game
     	@game = Game.find(params[:id])
     end
end
