#This handles the database interaction for the film database table.
#Here I added validation to avoid blank inputs

class Film < ApplicationRecord
	has_many :reviews

	validates_presence_of :filmtitle,  presence: true
	validates_presence_of :filmdescription,  presence: true
	validates_presence_of :filmdirector,  presence: true
	validates_presence_of :filmrating,  presence: true
	validates_presence_of :filmstarname,  presence: true
end