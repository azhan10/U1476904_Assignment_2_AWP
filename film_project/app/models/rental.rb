class Rental < ApplicationRecord
	validates :filmtitle,  presence: true
     validates :filmduration,  presence: true
     validates :rentalstatus,  presence: true
     validates :user_id,  presence: true
end


@rental = Rental.new
@rental.valid? 
@rental.errors.messages