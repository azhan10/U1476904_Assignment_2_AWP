#The class is used to get all film information in the database
#The show function is used here to view more information of a film

class FilmsController < ApplicationController
  before_action :set_film, only: [:show]

  # The index function gets all film information and subdivide the information into pages (13 per page)
  def index
    @films = Film.all.paginate(page: params[:page], per_page: 30)
    @filmAmount = Film.count
   
    if params[:search]
      @films = Film.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
    else
      @films = Film.all.order("created_at DESC").paginate(page: params[:page])
    end

  end

  #These action function is not used for film interface
  def show
    @film = Film.find(params[:id])
    @reviewAmount = Review.where(film_id: @film).count
    @reviewAverage = Review.where(film_id: @film).average('rating')
    @reviewExist = Review.where(film_id: @film).exists?

    if @reviewExist == false
      flash[:anyReviews] = 'No Reviews'
      flash[:anyReviewAverage] = 'No Rating'
    else
       flash[:anyReviews] = ['Reviews Amount: ', @reviewAmount].join()
       flash[:anyReviewAverage] = ['Reviews Rating: ', @reviewAverage].join()
    end

  end

  def new
  end

  def edit
  end

  def create
  end

  def update 
  end

  def destroy
  end

  #These are private methods
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
