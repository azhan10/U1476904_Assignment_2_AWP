#The class is used to get all film information in the database
#The show function is used here to view more information of a film

class FilmsController < ApplicationController
  before_action :set_film, only: [:show]

  # The index function gets all film information and subdivide the information into pages (13 per page)
  def index
    @films = Film.all.paginate(page: params[:page], per_page: 30)
  end

  #These action function is not used for film interface
  def show
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
