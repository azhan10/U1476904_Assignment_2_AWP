class Rental
  include Mongoid::Document

  field :filmtitle, type: String
  field :filmduration, type: String
  field :rentalstatus, type: String
  field :user_id, type: String
  field :username, type: String
  field :created_at, :type => Date, default: ->{ Date.today }


  validates :filmtitle,  presence: true
     validates :filmduration,  presence: true
     validates :rentalstatus,  presence: true
     validates :user_id,  presence: true
      validates :username,  presence: true
end

#Validations purposes
@rental = Rental.new
@rental.valid? 
@rental.errors.messages