class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :election
  belongs_to :user
  
  has_many :votes

  validate  :already_enrolled, :already_enrolled_from_party
  

  def already_enrolled
    if election.candidates.where(user_id: user_id).present?
      errors.add(:user, 'already enrolled for this election')
    end
  end

  def already_enrolled_from_party
    participated_parties = election.candidates.pluck(:party_id)
    if participated_parties.include? party_id
      errors.add(:user, 'already enrolled from your party')
    end
  end
end
