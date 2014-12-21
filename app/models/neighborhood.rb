class Neighborhood < ActiveRecord::Base

  has_many :businesses
  belongs_to :borough

  validates :name, presence: true
  validates_presence_of :borough_id

end
