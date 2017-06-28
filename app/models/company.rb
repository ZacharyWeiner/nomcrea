class Company < ApplicationRecord
  has_many :users
  has_many :proposals

  def safe_logo
    if self.logo
      self.logo 
    else
      "http://lorempixel.com/400/200"  
    end 
  end
end
