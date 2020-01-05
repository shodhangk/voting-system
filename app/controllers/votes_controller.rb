class VotesController < ApplicationController

    def create
        byebug
        vote_validator = VoteValidator.call(@currrent_user, voter_params)
        if vote_validator.success?
         create_response("Success", 200)
        else
            create_response(vote_validator.errors, 401)
        end
    end
   
    private

    def voter_params
        params.permit(:election_id, :candidate_id)
    end 
    
end
