class GamesController < ApplicationController
	before_action :set_game, only: [:show]
	def index
		@games = Game.all.paginate(page: params[:page], per_page: 30)
	end

	def show
	end

	private
		def set_game
      		@game = Game.find(params[:id])
    	end
end
