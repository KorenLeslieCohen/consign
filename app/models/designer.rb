class Designer < ActiveRecord::Base

  has_many :business_designers
  has_many :businesses, through: :business_designers

end
