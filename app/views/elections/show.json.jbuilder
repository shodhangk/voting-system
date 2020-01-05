json.id @election.id
json.name @election.name
json.status @election.status
json.candidates do
  json.array! @election.candidates do |candidate| 
    json.candiadte_id candidate.id
    json.name candidate.user.name
    json.profile candidate.user.profile_url
    json.votes candidate.votes.count
    json.party do 
      json.name candidate.party.name
      json.logo candidate.party.logo_url
    end
  end  
end