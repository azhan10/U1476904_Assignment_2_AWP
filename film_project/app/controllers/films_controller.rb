#The class is used to get all films information in the database

class FilmsController < ApplicationController
  before_action :set_film, only: [:show]

  # The index function gets all film information and subdivide the information into pages (13 per page)
  def index
    @films = Film.all.paginate(page: params[:page], per_page: 30)
    @filmAmount = Film.count

    #This is for the search game form
    if params[:search]
     @films = Film.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 30)
    else
     @films = Film.all.order('created_at DESC').paginate(page: params[:page], per_page: 30)
    end
  end

  #These action function is used for film interface.
  #Getting several correct information for the show interface such as the amount of current reviews of a film
  def show
    @film = Film.find(params[:id])
    @reviewAmount = Filmreview.where(film_id: @film).count
    #Rounding the review average to 2 decimal places
    if(@reviewAmount != 0)
      @reviewAverage = Filmreview.where(film_id: @film).avg('rating').round(2)
    end
    @reviewExist = Filmreview.where(film_id: @film).exists?

    #Condition is executed depending on the current review information of a film
    if @reviewExist == false
      flash[:anyReviews] = 'No Reviews'
      flash[:anyReviewAverage] = 'No Rating'
    else
       flash[:anyReviews] = ['Total Reviews: ', @reviewAmount].join()
       flash[:anyReviewAverage] = ['Average Score: ', @reviewAverage].join()
    end

  end

  private
    #The set film function is used to get film information
    def set_film
      @film = Film.find(params[:id])
    end

    #The function is used for database interactions such as retrieving
    def film_params
      params.require(:film).permit(:filmtitle, :filmdescription)
    end
end
