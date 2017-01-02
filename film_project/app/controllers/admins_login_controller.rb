#The class is the administrator account page. 
#Where it displays all the information for a administrator.
#It contains the customer's rentals, films and games informations.
#It also contains the admin account details such as email, first name and so on.
#It finally contains all the current users that are NOT administrators
#The controller also contains an authorization mechanism
#This is used to check if their is an existing session
#If so, direct the user to that interface, otherwise, return to the login page

class AdminsLoginController < ApplicationController
	#This is used to determine if theirs a session
	before_filter :authorizeAdmin

	#The index function holds current information stored in the database.
	def index
		#Here I'm getting the rentals, films, games, the account holder and all current users
		@rentals = Rental.all.limit(5).order('created_at desc')
		@films = Film.all.paginate(page: params[:page], per_page: 20)
		@games = Game.all.paginate(page: params[:page], per_page: 20)
		@adminusers = User.all.limit(5).order('created_at desc')
		@currentuser = Admin.where(id: admin_user.id)
	end 

	#The edit function is used to edit information of the acccount holder such as email
	def edit
		@currentuser = Admin.find(params[:id])
	end

	#This function allows administrators to delete their information
	def destroy
		#Get the current adminstrator id
		@currentuser = Admin.find(params[:id])
		#Delete their account
  		@currentuser.destroy
  		#Direct the user to the logout page
	  	redirect_to '/adminlogout'
	end
	
	#This function allows administrators to update information
	def update
		#Get admin id
		@currentuser = Admin.find(params[:id])
		#Editadmin is used for validation reasons
		@currentuser = Editadmin.find(params[:id])
		#Check if text are filled
		@currentuser.valid? 
		#If validation comes true, then update the information and direct the user back to the account page
		if @currentuser.update(currentAdmin_params)
			redirect_to '/adminCool'
		else
			#Otherwise, provide the errors to the same interface
			@currentuser.errors.messages
			flash[:error] = "Please enter all content"
			#This is used to return back to the pervious interface
   			redirect_to :back
		end
	end

	#These are private methods
	private
	#These methods are used to perform database interaction such as email
		def currentAdmin_params
    		params.require(:admin).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  		end
end
