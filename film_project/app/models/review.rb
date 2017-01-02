#This handles the database interaction for the review database table.
#Here I added validation to avoid blank inputs

class Review < ApplicationRecord
	validates_presence_of :rating,  presence: true, :message  => "Please select a rating"
     validates_presence_of :commenter,  presence: true, :message  => "Please enter your name"
     validates_presence_of :body,  presence: true, :message  => "Please enter your review"
  belongs_to :film
end
