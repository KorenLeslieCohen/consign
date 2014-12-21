class Designer < ActiveRecord::Base

  has_many :business_designers
  has_many :businesses, through: :business_designers

  validates :name, presence: true

  def self.search(search)
    Designer.where("name LIKE ?", "%#{search.upcase}%")
  end

end
