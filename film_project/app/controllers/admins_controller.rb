class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end
	def create
    admin = Admin.new(admin_params)
    if admin.save
      session[:admin_id] = admin.id
      redirect_to '/adminCool'
    else
      @admin = Admin.new
      @admin.valid? 
      @admin.errors.messages
      render 'new'
    end
  end

private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :salt, :firstname, :secondname, :address, :postcode)
  end
end
