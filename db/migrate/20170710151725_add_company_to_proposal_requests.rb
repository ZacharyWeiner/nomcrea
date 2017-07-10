class AddCompanyToProposalRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposal_requests, :company, foreign_key: true
  end
end
