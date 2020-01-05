class Admin::ElectionsController < ApplicationController
  before_action :authenticate_admin

  def create
    begin
      @election = Election.create!(election_params)
    rescue ActiveRecord::RecordInvalid => invalid
      create_response(invalid.message, 400)
      return
    end
    create_response(@election, 200)
  end

  def index
    create_response(Election.all, 200)
  end

  private

  def election_params
    params.require(:election).permit(:name, :start_time, :end_time, :additional_instructions)
  end
end
