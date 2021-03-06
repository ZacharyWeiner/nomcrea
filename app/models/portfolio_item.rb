class PortfolioItem < ApplicationRecord
  belongs_to :portfolio
  has_many :portfolio_item_attachments, dependent: :destroy 

  mount_uploader :cover_image, CoverImageUploader
  def safe_cover_image
    if self.cover_image?
      self.cover_image 
    else
      "http://lorempixel.com/400/200"  
    end 
  end
end
