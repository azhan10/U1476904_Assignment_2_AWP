class LoginController < ApplicationController
  before_filter :authorize

  def index
		@rentals = Rental.where(user_id: current_user.id).limit(5)
		@buys = Buy.where(user_id: current_user.id).limit(5)
	end 
end
