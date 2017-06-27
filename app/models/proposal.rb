class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  has_many :requirements
end
