class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :business
  has_many :reviews, :dependent => :destroy # destroys associated photos when business destroyed
  has_many :photos, :dependent => :destroy # destroys associated photos when business destroyed

  # Amazon S3 photos
  has_attached_file :user_profile_photo
    # :storage => :s3, 
    # :bucket => "consignnyc",
    # :s3_credentials => "#{Rails.root}/config/aws.yml",
    # :s3_protocol => "https"

  # Validations
  validates :agree_to_terms, :presence => { :message => " must be checked" }
  validates :tagline, length: {maximum: 30}
  validates :city, length: {maximum: 30}
  validates :url, length: {maximum: 30}
  validates :bio, length: {maximum: 200}
  validates :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  # validates :user_profile_photo, :attachment_presence => { :message => "You must include a profile photo" }
  validates_with AttachmentSizeValidator, :attributes => :user_profile_photo, :less_than => 3.megabytes
  validates_attachment_content_type :user_profile_photo, :content_type => /\Aimage\/.*\Z/
  
  # Facebook OmniAuth
  def self.from_omniauth(auth_hash)
    where(auth_hash.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth_hash.provider
      user.uid = auth_hash.uid
      user.first_name = auth_hash.info.first_name
      user.last_name = auth_hash.info.last_name
      user.email = auth_hash.info.email
      user.user_profile_photo = auth_hash.info.image + "?type=large"
      user.gender = auth_hash.extra.raw_info.gender
      user.oauth_token = auth_hash.credentials.token
      user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
      user.save!
    end
  end

end
