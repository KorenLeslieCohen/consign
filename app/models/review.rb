class Review < ActiveRecord::Base

  belongs_to :business
  belongs_to :user

  # Validations
  validates_presence_of :business_id, :user_id
  validates :rating, presence: true 
  validates :content, presence: true, length: {minimum: 30}
  validates :role, presence: true

  # Action Mailer
  after_create :send_review_email
  after_create :send_admin_review_email
  after_create :send_store_review_email

  # user review email
  def send_review_email
    Mailer.new_review_email(user, business).deliver
  end

  # consign admin review email
  def send_admin_review_email
    Mailer.admin_review_email(user, content, business, rating).deliver
  end

  # store admin review email
  def send_store_review_email
    if (business.admin_email != nil && business.admin_email != "")
      Mailer.store_review_email(user, content, business, rating).deliver
    end
  end

end
