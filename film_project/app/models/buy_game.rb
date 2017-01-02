#This handles the database interaction for the game purchase database table.
#Here I added validation to avoid blank inputs

class BuyGame < ApplicationRecord
	validates_presence_of :platform,  presence: true
	validates_presence_of :gametitle,  presence: true
	validates_presence_of :gameprice,  presence: true
	validates_presence_of :paymenttype,  presence: true
end

@buyGame = BuyGame.new
@buyGame.valid? 
@buyGame.errors.messages