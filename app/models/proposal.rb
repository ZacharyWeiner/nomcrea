 class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  has_many :requirements
  has_many :proposal_requests
  has_many :proposal_messages
  has_and_belongs_to_many :tags
  scope :available, -> {where(accepted: false)}
  scope :completed, -> {where(completed: true)}


  def skills
    self.tags.where(tag_type: 'skill')
  end

  def location
    self.tags.locations.first
  end

  def scenes
    self.tags.scenes
  end

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

  def tag_name
    tags.try(:name)
  end

  def tag_name=(name)
    self.tags = Tag.find_or_create_by(name: name) if name.present?
  end
end
