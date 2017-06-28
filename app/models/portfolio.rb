class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :portfolio_items

  acts_as_taggable_on :skills
  def safe_cover_image
    if self.cover_image
      self.cover_image 
    else
      "http://lorempixel.com/400/200"  
    end 
  end
end
