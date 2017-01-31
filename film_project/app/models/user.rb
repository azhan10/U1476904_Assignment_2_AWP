#Using MongoDB

class User
  include Mongoid::Document
  include ActiveModel::Validations

  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :salt, type: String
  field :firstname, type: String
  field :secondname, type: String
  field :address, type: String
  field :postcode, type: String
  field :created_at, :type => Date, default: ->{ Date.today }

  validates_presence_of :name,  presence: true, length: { minimum: 5 }, uniqueness: true
     validates_presence_of :email,  presence: true, uniqueness: true
     validates_presence_of :password, presence: true, length: { minimum: 7 }
     validates_presence_of :salt,  presence: true, length: { minimum: 7 }
     validates_presence_of :firstname,  presence: true
     validates_presence_of :secondname,  presence: true
     validates_presence_of :address,  presence: true
     validates_presence_of :postcode,  presence: true


end


#This is used for exisiting user's interface
class Olduser < User
     validates_presence_of :email,  presence: true
     validates_presence_of :password, presence: true
      #validates_presence_of :password, length: { minimum: 7 }
end
