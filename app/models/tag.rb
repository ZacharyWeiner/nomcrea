class Tag < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :proposals
  has_and_belongs_to_many :portfolios

  has_many :children, :class_name => "Tag", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Tag", :foreign_key => "parent_id"
end
