class Message < ActiveRecord::Base

  validates :name, presence: true 
  validates :email, presence: true # use an email validation
  validates :body, presence: true

  after_create :send_message_email

  def send_message_email
    Mailer.message_email(name, email, body).deliver
  end

end
