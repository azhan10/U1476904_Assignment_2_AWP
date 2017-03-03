class GamereviewsController < ApplicationController
  
  #This function is used to users to review a game
	def create
		@game = Game.find(params[:game_id])
    	@review = @game.gamereviews.new(gamereview_params)
      if @review.save
				flash[:success] = 'Game review is added'
      	redirect_to game_path(@game)
    	else
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
