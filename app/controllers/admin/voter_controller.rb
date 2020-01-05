class Admin::VoterController < ApplicationController
  before_action :authenticate_admin

  def create
    begin
        @voter = User.create!(voter_params)
      rescue ActiveRecord::RecordInvalid => invalid
        create_response(invalid.message, 400)
        return
      end
      create_response(@voter, 200)
  end

  def index
    create_response(User.select(voter_attributes.push(:id)), 200)
  end

  private

  def voter_params
    params.require(:voter).permit(voter_attributes)
  end

  def voter_attributes
    User.column_names.map(&:to_sym) - [:id, :verification_id, :created_at, :updated_at, :password_digest]
  end
end
