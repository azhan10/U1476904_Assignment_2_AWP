#This handles the database interaction for the admin database table.
#Here I added several validation for many interfaces

class Admin < ApplicationRecord
     #Making sure the password is inputed in all login contents
	has_secure_password
end

#This is used for signing up interface
class Newadmin < Admin
     validates_presence_of :name,  presence: true, length: { minimum: 5 }, uniqueness: true
     validates_presence_of :email,  presence: true, uniqueness: true
     #validates_presence_of :password, length: { minimum: 7 }
     validates_presence_of :salt,  presence: true, length: { minimum: 7 }
     validates_presence_of :firstname,  presence: true
     validates_presence_of :secondname,  presence: true
     validates_presence_of :address,  presence: true
     validates_presence_of :postcode,  presence: true
end

#This is used for editing current administrator's information
class Editadmin < Admin
     validates_presence_of :password, length: { minimum: 7 }
     validates_presence_of :salt,  presence: true, length: { minimum: 7 }
     validates_presence_of :firstname,  presence: true
     validates_presence_of :secondname,  presence: true
     validates_presence_of :address,  presence: true
     validates_presence_of :postcode,  presence: true
end

#This is used for exisiting administrator's interface
class Oldadmin < Admin
     validates_presence_of :password,  presence: true
     validates_presence_of :email,  presence: true
     #validates_presence_of :password, length: { minimum: 7 }
end
