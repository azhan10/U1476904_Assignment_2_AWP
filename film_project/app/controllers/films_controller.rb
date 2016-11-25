class FilmsController < ApplicationController
  before_action :set_film, only: [:show]

  # GET /films
  # GET /films.json
  def index
    @films = Film.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /films/1
  # GET /films/1.json
  def show
  end

  # GET /films/new
  def new
    
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films
  # POST /films.json
  def create
   
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      params.require(:film).permit(:filmtitle, :filmdescription)
    end
end
