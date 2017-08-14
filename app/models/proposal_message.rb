class ProposalMessage < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  validates :message, presence: true
end
