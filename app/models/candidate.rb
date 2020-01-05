class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :election
  belongs_to :user
  
  has_many :votes
end
