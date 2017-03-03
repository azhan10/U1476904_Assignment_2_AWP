#Model for current films in the database
class Film
  include Mongoid::Document
  include Mongoid::Search

  field :filmtitle, type: String
  field :filmdescription, type: String
  field :filmdirector, type: String
  field :filmrating, type: String
  field :filmstarname, type: String

  has_many :filmreviews

	validates_presence_of :filmtitle,  presence: true
	validates_presence_of :filmdescription,  presence: true
	validates_presence_of :filmdirector,  presence: true
	validates_presence_of :filmrating,  presence: true
	validates_presence_of :filmstarname,  presence: true

#Search function using the film name	
def self.search(search)
  Film.where(filmtitle: /#{search}/i)
end

end
