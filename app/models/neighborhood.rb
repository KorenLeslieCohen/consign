class Neighborhood < ActiveRecord::Base

  has_many :businesses
  belongs_to :borough
  
end
