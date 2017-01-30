#The controller is for film information which is held by the administrator
#The administrator has the privledge to perform the CRUD operations.

class AdminfilmsController < ApplicationController

before_action :set_film, only: [:show]
	
	#The code below is used for the new interface. 
	#It handles the operation of adding new film data to the database
	def new
		@adminfilm = Film.new
	end

	#The show function is used to get all information of a film.
	#Examples includes the film's star name
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
		#Get the film id
		@adminfilm = Film.find(params[:id])
 		
 		#If update is successful, then direct back admin home page
  		if @adminfilm.update(adminfilm_params)
    		redirect_to '/adminCool'
  		else
  			#Otherwise, render the edit interface.
    		render 'edit'
  		end
	end

	#This function is used to delete a film information in the database using a film
	#identify
	def destroy
		#Get the film id
		@adminfilm = Film.find(params[:id])
  		#Delete the film row in the database
  		@adminfilm.destroy
 		#Direct administrator to the home page.
  		redirect_to '/adminCool'
	end

	#This function is used to create a new row of film data to the database
	def create
		#Get the film id
		@adminfilm = Film.new(adminfilm_params)
		#If save was completed
  		if @adminfilm.save
  		#Direct the user to the home page
   		 redirect_to '/adminCool'
 		else
 		#Otherwise, render the new interface
   		 render 'new'
  		end
	end

	#These methods are set private
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
