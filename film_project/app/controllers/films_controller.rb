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
  #It also contains the feature to export film information to PDF format
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

    respond_to do |format|
    format.html
    format.pdf do
      pdf = Prawn::Document.new
      pdf.text @film.filmtitle, :size => 30, :align => :center
      pdf.text 'Film Title: ' + @film.filmtitle
      pdf.move_down 10
      pdf.text ['Film Description: ', @film.filmdescription].join();
      pdf.move_down 10
      pdf.text ['Film Star Name: ', @film.filmstarname].join();
      pdf.move_down 10
      pdf.text ['Film Rating: ', @film.filmrating].join();
      pdf.move_down 10
      pdf.text ['Film Director: ', @film.filmdirector].join();
      pdf.move_down 10

      if @reviewAmount == 0
        pdf.text "No Reviews", :align => :center, :size => 25
      else
        pdf.text ['Number of reviews: ', @reviewAmount].join()
        pdf.move_down 10
        pdf.text ['Average Rating: ', @reviewAverage].join()

        pdf.text "Reviews", :style => :bold, :align => :center, :size => 25

        currentReviews = [["Customer Name", "Film Rating", "Comment", "Review Added"]]
        currentReviews += @film.filmreviews.map do |s|

          [
            s.commenter,
            s.rating,
            s.body,
            s.created_at
          ]
        end

        pdf.table(currentReviews, header: true, width: 400, :row_colors => ["F0f0f0", "ffffcc"]) do
          row(0).font_style = :bold
        end
      end


      send_data pdf.render,
          filename: "film_#{@film.filmtitle}",
          type: 'application/pdf',
          disposition: 'inline'
      end
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
