#This handles the database interaction for the film purchase database table.
#Here I added validation to avoid blank inputs

class Buy < ApplicationRecord
	validates_presence_of :filmtitle,  presence: true
	validates_presence_of :filmprice,  presence: true
	validates_presence_of :paymenttype,  presence: true
end


@buy = Buy.new
@buy.valid? 
@buy.errors.messages