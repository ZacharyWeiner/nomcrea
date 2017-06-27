class PortfolioItem < ApplicationRecord
  belongs_to :portfolio
  has_many :portfolio_item_attachments
  acts_as_taggable_on :equipment
end
