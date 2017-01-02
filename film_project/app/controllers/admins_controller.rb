#The class is used for signing up new administrator users.
#The class uses session to log in and out.

class AdminsController < ApplicationController
  #Administrator access this page to sign up
  def new
    @admin = Admin.new
  end
  #The create function is used to start a session and direct hte user to the account page
	def create
    admin = Admin.new(admin_params)
    #If admin is correct, then start the session
    if admin.save
      session[:admin_id] = admin.id
      #And direct the user to account page
      redirect_to '/adminCool'
    else
      #Otherwise, return back error messages in the new interface
      @admin = Newadmin.new
      @admin.valid? 
      @admin.errors.messages
      render 'new'
    end
  end

#These are private methods
private
  #The method is used to perform several database interaction.
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  end
end
