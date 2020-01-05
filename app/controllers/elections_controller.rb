class ElectionsController < ApplicationController
  before_action :set_election, only: [:show]
  def index
    @elections = Election.all
    #create_response(Election.all)
  end

  def show
    @election
  end

  private 
  def set_election
    @election = Election.find_by_id(params[:id])
  end
end
