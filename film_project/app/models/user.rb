class User < ApplicationRecord
	validates :name,  presence: true, length: { minimum: 5 }
     validates :email,  presence: true
     validates :password_digest,  presence: true, length: { minimum: 7 }
     validates :salt,  presence: true, length: { minimum: 7 }
     validates :firstname,  presence: true
     validates :secondname,  presence: true
     validates :address,  presence: true
     validates :postcode,  presence: true

     validates :name, uniqueness: true
     validates :email, uniqueness: true
	 has_secure_password
end
