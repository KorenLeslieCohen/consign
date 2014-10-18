class PhotoTag < ActiveRecord::Base

  belongs_to :photo 
  belings_to :tag 
  
end
