#The class is the user account page. 
#Where it displays all the information for a user.
#It contains the customer's rental, films, games and user informations.
#The controller also contains an authorisation mechanism
#This is used to check if their is an existing session
#If so, direct the user to that interface, otherwise, return to the login page

class LoginsController < ApplicationController
	#This is used to determine if theirs a session
  before_filter :authorize

  	#The index function holds current information stored in the database such as the rentals
  def index
		@rentals = Rental.where(user_id: current_user.id).limit(5)
		@buyFilms = BuyFilm.where(user_id: current_user.id).limit(5)
		@users = User.where(id: current_user.id)
		@buyGames = BuyGame.where(user_id: current_user.id).limit(5)

		@RentedAmount = Rental.where(user_id: current_user.id).count
		@purchaseAmount = BuyFilm.where(user_id: current_user.id).count
		@gameAmount = BuyGame.where(user_id: current_user.id).count

	end 

	#This function allows users to delete their information
	def destroy
		@user = User.find(params[:id])
  		@user.destroy
	  	redirect_to '/logout'
	end

	#The edit function is used to edit information of the acccount holder such as email
	def edit
		@user = User.find(params[:id])
	end

	#This function allows administrators to update information
	def update
		@user = User.find(params[:id])
     	@user.valid?
     	#Update information (if successfull) or abort (if updates fails)
     	@user.errors.messages
  		if @user.update(account_params)
    		redirect_to '/cool'
  		else
  			flash[:error] = 'Please enter all content'
    		redirect_to :back
  		end
	end
	
	private
	 #These methods are used to perform database interaction such as email
	 def account_params
    	params.require(:user).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  	end
end
