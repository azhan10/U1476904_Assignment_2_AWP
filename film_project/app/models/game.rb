#This handles the database interaction for the game database table.
#Here I added validation to avoid blank inputs

class Game < ApplicationRecord
	validates_presence_of :gametitle,  presence: true
	validates_presence_of :gameDescription,  presence: true
	validates_presence_of :gamerating,  presence: true
	validates_presence_of :gamegenre,  presence: true
	validates_presence_of :platform,  presence: true

	def self.search(search)
  	  where("gametitle LIKE ?", "%#{search}%") 
	end
end
