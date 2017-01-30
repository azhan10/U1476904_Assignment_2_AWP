
class BuyGame
  include Mongoid::Document

   field :platform, type: String
  field :gametitle, type: String
  field :gameprice, type: String
   field :paymenttype, type: String
   field :user_id, type: String
   field :created_at, :type => Date, default: ->{ Date.today }


  validates_presence_of :platform,  presence: true
	validates_presence_of :gametitle,  presence: true
	validates_presence_of :gameprice,  presence: true
	validates_presence_of :paymenttype,  presence: true
end

#Validations purposes

@buyGame = BuyGame.new
@buyGame.valid? 
@buyGame.errors.messages