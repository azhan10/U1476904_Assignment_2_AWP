class AdminsLoginController < ApplicationController
	before_filter :authorizeAdmin

	def index
		@rentals = Rental.all.limit(5).order('created_at desc')
		@films = Film.all.paginate(page: params[:page], per_page: 20)
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
		if params[:password].blank?
			flash[:error] = "Password is not mentioned"
			redirect_to edit_admins_login_path(@currentuser)
		elsif  params[:salt].blank?
			flash[:error] = "Retype Password is not mentioned"
			redirect_to edit_admins_login_path(@currentuser)
		elsif  params[:firstname].blank?
			flash[:error] = "First name is not mentioned"
			redirect_to edit_admins_login_path(@currentuser)
		elsif  params[:secondname].blank?
			flash[:error] = "Second name is not mentioned"
			redirect_to edit_admins_login_path(@currentuser)
		elsif  params[:address].blank?
			flash[:error] = "Address is not mentioned"
			redirect_to edit_admins_login_path(@currentuser)
		elsif  params[:postcode].blank?
			flash[:error] = "Post code is not mentioned"
			redirect_to edit_admins_login_path(@currentuser)
		else
			if @currentuser.update(currentAdmin_params)
				redirect_to '/adminCool'
			else
				flash[:error] = "Something went wrong"
   				render 'edit'
			end
		end
		
	end

	private
		def currentAdmin_params
    		params.require(:admin).permit(:name, :email, :password, :salt,  :firstname, :secondname, :address, :postcode)
  		end
end
