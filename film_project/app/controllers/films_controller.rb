#The class is used to get all films information in the database

class FilmsController < ApplicationController
  before_action :set_film, only: [:show]

  # The index function gets all film information and subdivide the information into pages (13 per page)
  # it also functions to search current films
  def index
    @films = Film.all.paginate(page: params[:page], per_page: 30)
    @filmAmount = Film.count

    if params[:search]
     @films = Film.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 30)
    else
     @films = Film.all.order('created_at DESC').paginate(page: params[:page], per_page: 30)
    end
  end

  #Show information of a film such as their current reviews
  def show
    @film = Film.find(params[:id])
    @reviewAmount = Filmreview.where(film_id: @film).count
    if(@reviewAmount != 0)
      @reviewAverage = Filmreview.where(film_id: @film).avg('rating').round(2)

      @oneStar = Filmreview.where(film_id: @film, rating: 1)
      @twoStar = Filmreview.where(film_id: @film, rating: 2)
      @threeStar = Filmreview.where(film_id: @film, rating: 3)
      @fourStar = Filmreview.where(film_id: @film, rating: 4)
      @fiveStar = Filmreview.where(film_id: @film, rating: 5)
    end
    @reviewExist = Filmreview.where(film_id: @film).exists?

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
