class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  has_many :requirements
  has_many :proposal_requests
  has_and_belongs_to_many :tags
  scope :available, -> {where(accepted: false)}
  scope :completed, -> {where(completed: true)}
  

  def is_complete
    if !self.completed 
      incomplete = self.requirements.where(accepted: 0)
      if incomplete.count == 0
        self.completed = true
        self.completed_on = Date.today 
        self.save
      end
    end
  end
end
