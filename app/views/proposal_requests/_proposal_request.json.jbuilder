json.extract! proposal_request, :id, :proposal_id, :user_id, :accepted, :accepted_on, :created_at, :updated_at
json.url proposal_request_url(proposal_request, format: :json)
