class Business < ActiveRecord::Base

  belongs_to :user
  belongs_to :neighborhood 
  belongs_to :borough
  has_many :photos, :dependent => :destroy # destroys associated photos when business destroyed
  has_many :reviews, :dependent => :destroy # destroys associated reviews when business destroyed
  has_many :business_biztags
  has_many :biztags, through: :business_biztags
  accepts_nested_attributes_for :biztags 
  has_many :business_designers
  has_many :designers, through: :business_designers
  accepts_nested_attributes_for :designers

end
