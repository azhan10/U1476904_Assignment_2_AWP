class FilmreviewsController < ApplicationController
	  #The functions is used to allow users to add a review of a film
    #Error messages are handled such as reviewer name
	def create
		@film = Film.find(params[:film_id])
    	@review = @film.filmreviews.new(filmreview_params)
      if @review.save
				flash[:success] = 'Film review is added'
      	redirect_to film_path(@film)
    	else
        flash[:error] = 'Please enter all content'
        flash[:commenter] = @review.errors[:commenter].first
        flash[:body] = @review.errors[:body].first
       	redirect_to :back
   		end
  end

  private
    #This is used to perform database interaction with a database table
    def filmreview_params
      params.require(:filmreview).permit(:commenter, :body, :rating)
    end
end
