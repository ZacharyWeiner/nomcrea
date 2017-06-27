class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :portfolio_items

  acts_as_taggable_on :skills
end
