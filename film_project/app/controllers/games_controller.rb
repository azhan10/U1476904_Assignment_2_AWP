#The class is used to get all games information in the database

class GamesController < ApplicationController
	before_action :set_game, only: [:show]
	  # The index function gets all game information and subdivide the information into pages (30 per page)
	def index
		@games = Game.all
		@gamesAmount = Game.count

		@games = Game.all.paginate(:page => params[:page], :per_page => 30)

    #This is for the search game form
		if params[:search]
     		@games = Game.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 30)
    	else
    		@games = Game.all.order('created_at DESC').paginate(page: params[:page], per_page: 30)
    	end	
	end

#The show function is used here to view more information of a film such as the game reviews
	def show
		@games = Game.find(params[:id])
		@reviewAmount = Gamereview.where(game_id: @games).count
    @reviewAverage = Gamereview.where(game_id: @games).avg('rating')
    @reviewExist = Gamereview.where(game_id: @games).exists?

    if @reviewExist == false
      flash[:anyReviews] = 'No Reviews'
      flash[:anyReviewAverage] = 'No Rating'
    else
       flash[:anyReviews] = ['Total Reviews: ', @reviewAmount].join()
       flash[:anyReviewAverage] = ['Average Score: ', @reviewAverage].join()
    end
	end

	private
	 #The set game function is used to get game information
	 def set_game
     	@games = Game.find(params[:id])
     end
end
