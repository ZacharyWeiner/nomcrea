class PortfolioItemAttachment < ApplicationRecord
  belongs_to :portfolio_item
  acts_as_taggable_on :equipment
end
