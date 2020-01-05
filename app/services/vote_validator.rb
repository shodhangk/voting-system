class VoteValidator
  prepend SimpleCommand

  def initialize(user, params)
    @voter = user
    @candidate_id = params[:candidate_id]
    @election = Election.find_by_id(params[:election_id])
  end

  def call
    return unless validate_vote
    @voter.votes.create(params)
  end

  private

  attr_reader :voter, :candidate_id, :election

  def validate_vote
    valid_election? && valid_condidate? && already_voted?
  end

  def valid_election?
    return true if election.present? && election.active?
    errors.add(:Election, 'Election is not active or invalid') && nil
    false
  end

  def valid_condidate?
    return true if election.candidates.where(id: candidate_id).last.present?
    errors.add(:Candidate, 'Candidate is not registered for this election') && nil
    false
  end

  def already_voted?
    byebug
    return true if voter.votes.where(candidate_id: election.candidates.pluck(:id)).last.blank?
    errors.add(:Voted, 'You already voted') && nil
    false
  end

end
