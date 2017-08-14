json.extract! proposal_message, :id, :message, :user_id, :proposal_id, :created_at, :updated_at
json.url proposal_message_url(proposal_message, format: :json)
