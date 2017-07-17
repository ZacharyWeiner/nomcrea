class ScheduleItem < ApplicationRecord
  belongs_to :schedule
  has_and_belongs_to_many :tags


  def location
    self.tags.locations.first
  end 

  def set_location(tag)
    if !self.location.nil?
      self.tags.delete(self.tags.locations.first)
    end 
    self.tags << tag
    self.save
  end
end
