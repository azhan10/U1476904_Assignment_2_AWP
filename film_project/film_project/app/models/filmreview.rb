class Filmreview
  include Mongoid::Document

    field :commenter, type: String
  field :body, type: String
  field :rating, type: Integer
  field :created_at, :type => Date, default: ->{ Date.today }

  validates_presence_of :rating,  presence: true, :message  => "Please select a rating"
     validates_presence_of :commenter,  presence: true, :message  => "Please enter your name"
     validates_presence_of :body,  presence: true, :message  => "Please enter your review"
  belongs_to :film

end
