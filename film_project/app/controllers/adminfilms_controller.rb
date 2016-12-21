class AdminfilmsController < ApplicationController

before_action :set_film, only: [:show]
	def new
		@adminfilm = Film.new
	end

	def show
		@adminfilm = Film.find(params[:id])
	end

	def edit
		@adminfilm = Film.find(params[:id])
	end

	def update
		@adminfilm = Film.find(params[:id])
 
  		if @adminfilm.update(adminfilm_params)
    		redirect_to '/adminCool'
  		else
    		render 'edit'
  		end
	end

	def destroy
		@adminfilm = Film.find(params[:id])
  		@adminfilm.destroy
 
  		redirect_to '/adminCool'
	end

	def create
		@adminfilm = Film.new(adminfilm_params)
  		if @adminfilm.save
   		 redirect_to '/adminCool'
 		else
   		 render 'new'
  		end
	end

	private
	def set_film
      @adminfilm = Film.find(params[:id])
    end
  		def adminfilm_params
    		params.require(:film).permit(:filmtitle, :filmdescription, :filmdirector, :filmrating, :filmstarname)
  		end
end
