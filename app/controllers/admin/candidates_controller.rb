class Admin::CandidatesController < ApplicationController
  before_action :authenticate_admin
  before_action :set_party

  def create
    begin
      @candidate = @party.candidates.create!(candidate_params.except(:party))
    rescue ActiveRecord::RecordInvalid => invalid
      create_response(invalid.message, 400)
      return
    end
    create_response(@candidate, 200)
  end

  def index
  end

  private

  def candidate_params
    params.permit({ party: [:name, :logo] }, :user_id, :election_id)
  end

  def set_party
    @party = Party.find_by_name(candidate_params[:party][:name])
    @party ||= Party.create(candidate_params[:party])
  end
end
