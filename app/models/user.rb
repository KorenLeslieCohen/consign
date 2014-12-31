class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :business
  has_many :reviews, :dependent => :destroy 
  has_many :photos, :dependent => :destroy

  has_attached_file :user_profile_photo, 
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

  validates :tagline, length: {maximum: 30}
  validates :city, length: {maximum: 30}
  validates :url, length: {maximum: 30}
  validates :bio, length: {maximum: 200}
  validates :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  # validates :user_profile_photo, :attachment_presence => { :message => "You must include a profile photo" }
  validates_with AttachmentSizeValidator, :attributes => :user_profile_photo, :less_than => 3.megabytes
  validates_attachment_content_type :user_profile_photo, :content_type => /\Aimage\/.*\Z/
  
end
