class ScheduleItem < ApplicationRecord
  belongs_to :schedule
  has_and_belongs_to_many :tags
end
