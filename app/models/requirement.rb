class Requirement < ApplicationRecord
  enum status: {incomplete: 0, complete: 1}
  belongs_to :proposal
end
