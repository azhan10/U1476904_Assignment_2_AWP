class AdminfilmsController < ApplicationController

before_action :set_film, only: [:show]
	
	#It handles the operation of adding new film data to the database
	def new
		@adminfilm = Film.new
	end

	#The show function is used to get all information of a film such as its name.
	def show
		@adminfilm = Film.find(params[:id])
    	@reviewAmount = Filmreview.where(film_id: @adminfilm).count
	end

	#The edit funtion is used to edit information of a film using the identify
	def edit
		@adminfilm = Film.find(params[:id])
	end

	#The update function performs the operation of updating information of a film in the database
	def update
		@adminfilm = Film.find(params[:id])
  		if @adminfilm.update(adminfilm_params)
    		redirect_to '/adminCool'
  		else
    		render 'edit'
  		end
	end

	#This function is used to delete a film information in the database using a film id
	def destroy
		@adminfilm = Film.find(params[:id])
  		@adminfilm.destroy
  		redirect_to '/adminCool'
	end

	#This function is used to create a new row of film data to the database
	def create
		@adminfilm = Film.new(adminfilm_params)
  		if @adminfilm.save
   		 redirect_to '/adminCool'
 		else
   		 render 'new'
  		end
	end

	private
	#The first one is getting the chosen film id
	def set_film
      @adminfilm = Film.find(params[:id])
    end
  	
  	#This function is used to perform database interaction with all data content in the database
  	#For example, updating current information
  	def adminfilm_params
    	params.require(:film).permit(:filmtitle, :filmdescription, :filmdirector, :filmrating, :filmstarname)
  	end
end
