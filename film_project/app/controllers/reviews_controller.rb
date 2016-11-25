class ReviewsController < ApplicationController
	def create
		@film = Film.find(params[:film_id])
    	@review = @film.reviews.new(review_params)
    	if @review.save
      	redirect_to film_path(@film)
    	else
        flash[:error] = 'Please enter all content'
        flash[:commenter] = @review.errors[:commenter].first
        flash[:body] = @review.errors[:body].first
       	redirect_to :back
   		end 
  end
 
  private
    def review_params
      params.require(:review).permit(:commenter, :body, :rating)
    end
end
