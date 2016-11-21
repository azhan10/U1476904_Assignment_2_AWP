class ReviewsController < ApplicationController
	def create
    @film = Film.find(params[:film_id])
    @review = @film.reviews.create(review_params)
    redirect_to film_path(@film)
  end
 
  private
    def review_params
      params.require(:review).permit(:commenter, :body, :rating)
    end
end
