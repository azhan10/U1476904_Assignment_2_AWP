class AdminsController < ApplicationController
  #Administrator access this page to sign up
  def new
    @admin = Admin.new
  end

  #The create function is used to start a session and direct the user to the account page
  ##It then creates a session of the new user
	def create
    admin = Admin.new(admin_params)
    if admin.save
      session[:admin_id] = admin.id
      redirect_to '/adminCool'
    else
      @admin = Newadmin.new
      @admin.valid? 
      @admin.errors.messages
      render 'new'
    end
  end

private
  #The method is used to perform several database interaction.
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  end
end
