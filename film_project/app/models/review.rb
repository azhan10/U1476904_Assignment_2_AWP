class Review < ApplicationRecord
	validates :rating,  presence: true
     validates :commenter,  presence: true
     validates :body,  presence: true
  belongs_to :film
end
