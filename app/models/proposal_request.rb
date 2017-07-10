class ProposalRequest < ApplicationRecord
  belongs_to :proposal
  belongs_to :company
  belongs_to :user, optional: true
end
