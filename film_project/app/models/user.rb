class User < ApplicationRecord
	 has_secure_password
      
end


class Newuser < User
     validates_presence_of :name,  presence: true, length: { minimum: 5 }, uniqueness: true
     validates_presence_of :email,  presence: true, uniqueness: true
     #validates_presence_of :password, length: { minimum: 7 }
     validates_presence_of :salt,  presence: true, length: { minimum: 7 }
     validates_presence_of :firstname,  presence: true
     validates_presence_of :secondname,  presence: true
     validates_presence_of :address,  presence: true
     validates_presence_of :postcode,  presence: true
end

class Edituser < User
     #validates_presence_of :password, length: { minimum: 7 }
     validates_presence_of :salt,  presence: true, length: { minimum: 7 }
     validates_presence_of :firstname,  presence: true
     validates_presence_of :secondname,  presence: true
     validates_presence_of :address,  presence: true
     validates_presence_of :postcode,  presence: true
end


class Olduser < User
     validates_presence_of :email,  presence: true
     #validates_presence_of :password, length: { minimum: 7 }
end
