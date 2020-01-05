class VotesController < ApplicationController

    def create
        vote_validator = VoteValidator.call(@current_user, voter_params)
        if vote_validator.success?
         create_response("Success", 200)
        else
            create_response(vote_validator.errors, 400)
        end
    end
   
    private

    def voter_params
        params.permit(:election_id, :candidate_id)
    end 
    
end
