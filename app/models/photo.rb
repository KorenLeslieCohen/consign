class Photo < ActiveRecord::Base

  belongs_to :business
  belongs_to :user
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  accepts_nested_attributes_for :tags

  has_attached_file :business_photo, 
    :storage => :s3, 
    # :hash_secret => "longSecretString", 
    # :path => ":hash", 
    :bucket => "consignnyc",
    :s3_credentials => "#{Rails.root}/config/aws.yml",
    # :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
    # :s3_credentials => S3_CREDENTIALS,
    # :styles => { :thumb => "1024x768"}, 
    # :default_style => :thumb, 
    :s3_protocol => "https"

    validates :description, presence: true, length: {maximum: 20}
  # validates :business_photo, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :business_photo, :less_than => 3.megabytes
  validates_attachment_content_type :business_photo, :content_type => /\Aimage\/.*\Z/

  # Action Mailer 
  after_create :send_photo_email
  after_create :send_admin_photo_email

  def send_photo_email
    Mailer.new_photo_email(user, business).deliver
  end

  def send_admin_photo_email
    Mailer.admin_photo_email(user, business).deliver
  end

end

# models/photo.rb
# has_attached_file :image,
#   :styles => { :thumbnail => "100x100>" },
#   :storage => :s3,
#   :s3_credentials => "#{Rails.root}/config/s3.yml",
#   :bucket => "your_unique_s3_bucket";
