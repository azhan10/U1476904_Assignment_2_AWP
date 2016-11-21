class BuysController < ApplicationController

	def new
		@buy = Buy.new
	end

	def index
		 @buys = Buy.where(user_id: current_user.id)
	end

	def show
		@buys = Buy.find(params[:id])
	end

	def create
 	 @buy = Buy.new(buy_params)
 	 
  		if @buy.save
   		 redirect_to '/buys'
 		else
   		 render 'new'
  		end
	end

private
  def buy_params
    params.require(:buy).permit(:filmtitle, :filmprice, :paymenttype, :user_id)
  end
end
