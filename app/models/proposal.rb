class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  has_many :requirements
  has_many :proposal_requests

  acts_as_taggable_on :skills

  scope :available, -> {where(accepted: false)}
  
end
