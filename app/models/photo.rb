class Photo < ActiveRecord::Base

  belongs_to :business
  belongs_to :user
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  accepts_nested_attributes_for :tags

  has_attached_file :business_photo #, :storage => :s3, :hash_secret => "longSecretString", :path => ":hash", :bucket => "consignnyc", :styles => { :thumb => "1024x768"}, :default_style => :thumb, :s3_protocol => "https"
  # validates :business_photo, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :business_photo, :less_than => 3.megabytes
  validates_attachment_content_type :business_photo, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    { :access_key_id => AWS_ACCESS_KEY_ID, :secret_access_key => AWS_SECRET_ACCESS_KEY}
  end

end
