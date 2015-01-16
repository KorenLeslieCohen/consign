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

  # Amazon S3 photos
  has_attached_file :profile_photo

  # Validations
  validates :store_bio, length: {maximum: 700}
  validates_presence_of :name, :street_address, :city, :state, :zip, :phone, :map, :percent_to_client, :consignment_period, :return_policy
  validates :admin_email, :allow_blank => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :allow_blank => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :profile_photo, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :profile_photo, :less_than => 3.megabytes
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
 
 # Search
  def self.search(search)
    Business.where("name ILIKE ?", "%#{search.upcase}%") 
  end

end
