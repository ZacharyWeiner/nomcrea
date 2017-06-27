json.extract! proposal, :id, :title, :content, :deadline, :price, :company_id, :user_id, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
