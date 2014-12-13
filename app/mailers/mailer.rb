class Mailer < ActionMailer::Base

  # default email
  default from: "ConsignDotNYC@gmail.com"

  # sends user confirmation email following review
  def new_review_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your review has been posted on Consign.NYC")
  end

  # sends me email following user review
  def admin_review_email(user, content, business)
    @user = user
    @content = content
    @business = business
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Review on Consign.NYC")
  end

  # sends user confirmation email following photo
  def new_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your photo has been uploaded on Consign.NYC")
  end

  # sends me email following user review
  def admin_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Photo on Consign.NYC")
  end

  # contact form
  def message_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Message from Consign.NYC")
  end

end
