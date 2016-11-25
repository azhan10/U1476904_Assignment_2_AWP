class Review < ApplicationRecord
	validates_presence_of :rating,  presence: true, :message  => "Please select a rating"
     validates_presence_of :commenter,  presence: true, :message  => "Please enter your name"
     validates_presence_of :body,  presence: true, :message  => "Please enter your review"
  belongs_to :film
end
