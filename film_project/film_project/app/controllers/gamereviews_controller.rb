class GamereviewsController < ApplicationController
  #The create function is used to add new data content to the database
	def create
		@game = Game.find(params[:game_id])
    #Call the review_params method
    	@review = @game.gamereviews.new(gamereview_params)
    	#If the save was sucessful, then return back to pervious webpage
      if @review.save
				flash[:success] = 'Game review is added'
      	redirect_to game_path(@game)
    	else
        #Otherwise, return back to the current interface with error messages
        flash[:error] = 'Please enter all content'
        flash[:commenter] = @review.errors[:commenter].first
        flash[:body] = @review.errors[:body].first
       	redirect_to :back
   		end
  end

  private
    #This is used to perform database interaction with a database table
    def gamereview_params
      params.require(:gamereview).permit(:commenter, :body, :rating)
    end
end
