class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

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
  # validates :agree_to_terms, :presence => { :message => " must be checked" }
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
  def self.from_omniauth(auth)
    # where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.facebook_profile_photo = auth.info.image + "?type=large"
      user.gender = auth.extra.raw_info.gender
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.skip_confirmation!
      user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
