class AdminsLoginController < ApplicationController
	#Checks if theirs a session
	before_filter :authorizeAdmin

	#The index function displays infromation stored in the database such as games.
	def index
		@rentals = Rental.all.limit(5).order('created_at desc')
		@films = Film.all.paginate(page: params[:page], per_page: 30)
		@games = Game.all.paginate(page: params[:page], per_page: 30)
		@customerUsers = User.all.limit(5).order('created_at desc')
		@currentuser = Admin.where(id: admin_user.id)

		@filmsAmount = Film.count
		@gamesAmount = Game.count
		@customerUsersAmount = User.count
		@rentalsAmount = Rental.count

	end 

	#The edit function is used to edit information of the acccount holder such as email
	def edit
		@currentuser = Admin.find(params[:id])
	end

	#This function allows administrators to delete their information
	def destroy
		@currentuser = Admin.find(params[:id])
  		@currentuser.destroy
	  	redirect_to '/adminlogout'
	end
	
	#This function allows administrators to update information
	def update
		@currentuser = Admin.find(params[:id])
		@currentuser.valid? 
		if @currentuser.update(currentAdmin_params)
			redirect_to '/adminCool'
		else
			@currentuser.errors.messages
			flash[:error] = "Please enter all content"
   			redirect_to :back
		end
	end

	private
	#These methods are used to perform database interaction such as email
		def currentAdmin_params
    		params.require(:admin).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  		end
end
