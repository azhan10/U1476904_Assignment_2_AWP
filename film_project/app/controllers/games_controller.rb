#The class is used to get all game information in the database

class GamesController < ApplicationController
	before_action :set_game, only: [:show]
	  # The index function gets all game information and subdivide the information into pages (30 per page)
	  # it also functions to search current games
	def index
		@games = Game.all
		@gamesAmount = Game.count

		@games = Game.all.paginate(:page => params[:page], :per_page => 30)

		if params[:search]
     		@games = Game.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 30)
    	else
    		@games = Game.all.order('created_at DESC').paginate(page: params[:page], per_page: 30)
    	end
	end

#The show function is used here to view more information of a game such as the game reviews
  #It also contains the feature to export game information to PDF format
	def show
		@games = Game.find(params[:id])
		@reviewAmount = Gamereview.where(game_id: @games).count
		if @reviewAmount != 0
      @reviewAverage = Gamereview.where(game_id: @games).avg('rating').round(2)
			@oneStar = Gamereview.where(game_id: @games, rating: 1)
      @twoStar = Gamereview.where(game_id: @games, rating: 2)
      @threeStar = Gamereview.where(game_id: @games, rating: 3)
      @fourStar = Gamereview.where(game_id: @games, rating: 4)
      @fiveStar = Gamereview.where(game_id: @games, rating: 5)
	  end
    @reviewExist = Gamereview.where(game_id: @games).exists?

    if @reviewExist == false
      flash[:anyReviews] = 'No Reviews'
      flash[:anyReviewAverage] = 'No Rating'
    else
       flash[:anyReviews] = ['Total Reviews: ', @reviewAmount].join()
       flash[:anyReviewAverage] = ['Average Score: ', @reviewAverage].join()
    end

		respond_to do |format|
		format.html
		format.pdf do
			pdf = Prawn::Document.new
			pdf.text @games.gametitle, :size => 30, :align => :center
			pdf.text 'Game Title: ' + @games.gametitle
			pdf.move_down 10
			pdf.text ['Game Description: ', @games.gameDescription].join();
			pdf.move_down 10
			pdf.text ['Game Rating: ', @games.gamerating].join();
			pdf.move_down 10
			pdf.text ['Game Genre: ', @games.gamegenre].join();
			pdf.move_down 10
			pdf.text ['Game Platform: ', @games.platform].join();
			pdf.move_down 10

			if @reviewAmount == 0
				pdf.text 'No Reviews', :align => :center, :size => 20

			else
				pdf.text ['Number of reviews: ', @reviewAmount].join()
				pdf.move_down 10
				pdf.text ['Average Rating: ', @reviewAverage].join()
				pdf.move_down 10

				pdf.text "Reviews", :style => :bold, :align => :center, :size => 25

				currentReviews = [["Customer Name", "Film Rating", "Comment", "Review Added"]]
				currentReviews += @games.gamereviews.map do |s|

					[
						s.commenter,
						s.rating,
						s.body,
						s.created_at
					]
				end

				pdf.table(currentReviews, header: true, width: 400, :row_colors => ["F0f0f0", "ffffcc"]) do
					row(0).font_style = :bold
				end
			end

			send_data pdf.render,
					filename: "game_#{@games.gametitle}",
					type: 'application/pdf',
					disposition: 'inline'
			end
		end
	end

	private
	 #The set game function is used to get game information
	 def set_game
     	@games = Game.find(params[:id])
     end
end
