class Photo < ActiveRecord::Base

  belongs_to :business
  belongs_to :user
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  accepts_nested_attributes_for :tags
  
end
