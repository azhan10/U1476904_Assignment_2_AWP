#This handles the database interaction for the film purchase database table.
#Here I added validation to avoid blank inputs
class BuyFilm < ApplicationRecord
	validates_presence_of :filmtitle,  presence: true
	validates_presence_of :filmprice,  presence: true
	validates_presence_of :paymenttype,  presence: true
end


@buyFilms = BuyFilm.new
@buyFilms.valid? 
@buyFilms.errors.messages