class Borough < ActiveRecord::Base

  has_many :businesses
  has_many :neighborhoods
  
end
