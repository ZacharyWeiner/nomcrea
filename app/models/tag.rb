class Tag < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :proposals
  has_and_belongs_to_many :portfolios
end
