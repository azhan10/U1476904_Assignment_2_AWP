class Buy < ApplicationRecord
	validates_presence_of :filmtitle,  presence: true
	validates_presence_of :filmprice,  presence: true
	validates_presence_of :paymenttype,  presence: true
end


@buy = Buy.new
@buy.valid? 
@buy.errors.messages