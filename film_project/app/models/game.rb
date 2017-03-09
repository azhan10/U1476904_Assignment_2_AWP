#Model for the game information
class Game
  include Mongoid::Document
include Mongoid::Search

  field :gametitle, type: String
  field :gameDescription, type: String
  field :gamerating, type: String
  field :gamegenre, type: String
  field :platform, type: String

  has_many :gamereviews

  validates_presence_of :gametitle,  presence: true
	validates_presence_of :gameDescription,  presence: true
	validates_presence_of :gamerating,  presence: true
	validates_presence_of :gamegenre,  presence: true
	validates_presence_of :platform,  presence: true

  #Search engine for searching game titles
	def self.search(search)
    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    if search =~ regex
      search = "null"
      Game.where(gametitle: /#{search}/i)
    else
      Game.where(gametitle: /#{search}/i)
    end
  end

end
