class Game < ApplicationRecord
	validates_presence_of :gametitle,  presence: true
	validates_presence_of :gameDescription,  presence: true
	validates_presence_of :gamerating,  presence: true
	validates_presence_of :gamegenre,  presence: true
	validates_presence_of :platform,  presence: true
end
