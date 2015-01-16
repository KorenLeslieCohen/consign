class Photo < ActiveRecord::Base

  belongs_to :business
  belongs_to :user
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  accepts_nested_attributes_for :tags

  # Amazon S3 photos
  has_attached_file :business_photo

  # Validations
  validates :description, presence: true, length: {maximum: 20}
  validates :business_photo, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :business_photo, :less_than => 3.megabytes
  validates_attachment_content_type :business_photo, :content_type => /\Aimage\/.*\Z/

  # Action Mailer 
  after_create :send_photo_email
  after_create :send_admin_photo_email
  after_create :send_store_photo_email

  # user photo email
  def send_photo_email
    Mailer.new_photo_email(user, business).deliver
  end

  # consign admin photo email
  def send_admin_photo_email
    Mailer.admin_photo_email(user, business).deliver
  end

  # store admin review email
  def send_store_photo_email
    if (business.admin_email != nil && business.admin_email != "")
      Mailer.store_photo_email(user, business).deliver
    end
  end

end
