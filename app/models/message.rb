class Message < ActiveRecord::Base

  after_create :send_message_email

  def send_message_email
    Mailer.message_email(name, email, body).deliver
  end

end
