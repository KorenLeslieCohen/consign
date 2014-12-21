class PhotoTag < ActiveRecord::Base

  belongs_to :photo 
  belongs_to :tag

  validates :name, presence: true 
  
end
