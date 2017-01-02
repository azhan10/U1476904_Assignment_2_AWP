#This handles the database interaction for the rental database table.
#Here I added validation to avoid blank inputs

class Rental < ApplicationRecord
	validates :filmtitle,  presence: true
     validates :filmduration,  presence: true
     validates :rentalstatus,  presence: true
     validates :user_id,  presence: true
end


@rental = Rental.new
@rental.valid? 
@rental.errors.messages