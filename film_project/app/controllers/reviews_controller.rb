#This controller is used to allow users to add reviews of current films
#The controller only requires two actions to fulfill the review system

class ReviewsController < ApplicationController
  #The create function is used to add new data content to the database
	def create
    #Get current film id
		@film = Film.find(params[:film_id])
    #Call the review_params method
    	@review = @film.reviews.new(review_params)
    	#If the save was sucessful, then return back to pervious webpage
      if @review.save
      	redirect_to film_path(@film)
    	else
        #Otherwise, return back to the current interface with error messages
        flash[:error] = 'Please enter all content'
        flash[:commenter] = @review.errors[:commenter].first
        flash[:body] = @review.errors[:body].first
        #This is used to return back to the pervious page
       	redirect_to :back
   		end 
  end
 
 #These function is private
  private
    #This is used to perform database interaction with a database table
    def review_params
      params.require(:review).permit(:commenter, :body, :rating)
    end
end
