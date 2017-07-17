class Tag < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :proposals
  has_and_belongs_to_many :portfolios
  has_and_belongs_to_many :schedule_items

  has_many :children, :class_name => "Tag", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Tag", :foreign_key => "parent_id", optional: true

  scope :locations, -> {where(tag_type: ['region', 'country', 'city'])}
  scope :scenes, -> {where(tag_type: 'scene')}
  

  def self.build_locations
    regions = Tag.where(tag_type: ['region'])
    @locations= []
    regions.collect do |region|
      @locations << ["<b>#{region.name}</b>".html_safe, region.id]
      Tag.where(parent_id: region.id).each do |country|
        @locations << ["." + country.name, country.id]
        Tag.where(parent_id: country.id).each do |city|
          @locations << [".." + city.name, city.id]
        end 
      end 
    end
    @locations
  end 
end
