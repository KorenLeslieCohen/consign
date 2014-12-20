class Review < ActiveRecord::Base

  belongs_to :business
  belongs_to :user

  validates_presence_of :business_id, :user_id
  validates :rating, presence: true 
  validates :content, presence: true, length: {minimum: 30}

  # Action Mailer
  after_create :send_review_email
  after_create :send_admin_review_email

  def send_review_email
    Mailer.new_review_email(user, business).deliver
  end

  def send_admin_review_email
    Mailer.admin_review_email(user, content, business).deliver
  end

  
  
end
