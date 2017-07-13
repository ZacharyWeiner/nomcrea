class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :portfolio_items
  has_and_belongs_to_many :tags
  mount_uploader :cover_image, CoverImageUploader
  def safe_cover_image
    if self.cover_image?
      self.cover_image 
    else
      "http://lorempixel.com/400/200"  
    end 
  end
end
