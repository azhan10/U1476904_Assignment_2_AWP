class BuyFilm
  include Mongoid::Document

   field :filmtitle, type: String
  field :filmprice, type: String
  field :paymenttype, type: String
  field :user_id, type: String
    field :username, type: String
  field :created_at, :type => Date, default: ->{ Date.today }


  validates_presence_of :filmtitle,  presence: true
	validates_presence_of :filmprice,  presence: true
	validates_presence_of :paymenttype,  presence: true
end

#Validations purposes
@buyFilms = BuyFilm.new
@buyFilms.valid? 
@buyFilms.errors.messages