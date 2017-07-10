class AddRequestedByToProposalRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :proposal_requests, :requested_by, :string
  end
end
