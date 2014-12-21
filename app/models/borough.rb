class Borough < ActiveRecord::Base

  has_many :businesses
  has_many :neighborhoods

  validates :name, presence: true
  
end
