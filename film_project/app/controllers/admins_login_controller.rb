class AdminsLoginController < ApplicationController
	before_filter :authorizeAdmin

	def index
		@rentals = Rental.all.limit(5).order('created_at desc')
		@films = Film.all.paginate(page: params[:page], per_page: 20)
		@games = Game.all.paginate(page: params[:page], per_page: 20)
		@adminusers = User.all.limit(5).order('created_at desc')
		@currentuser = Admin.where(id: admin_user.id)
	end 

	def edit
		@currentuser = Admin.find(params[:id])
	end

	def destroy
		@currentuser = Admin.find(params[:id])
  		@currentuser.destroy
	  	redirect_to '/adminlogout'
	end
	
	def update
		@currentuser = Admin.find(params[:id])
		@currentuser = Editadmin.find(params[:id])
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
		def currentAdmin_params
    		params.require(:admin).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  		end
end
