class Message < ActiveRecord::Base

  validates_presence_of :email, :name, :body
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  after_create :send_message_email

  def send_message_email
    Mailer.message_email(name, email, body).deliver
  end

end
