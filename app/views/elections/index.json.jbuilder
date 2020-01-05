json.elections do
  json.array! @elections do |election|
    json.id election.id
    json.name election.name
    json.status election.status
  end
end