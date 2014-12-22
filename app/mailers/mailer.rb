class Mailer < ActionMailer::Base

  # default email
  default from: "ConsignDotNYC@gmail.com"

  # USER confirmation email following review
  def new_review_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your review has been posted on Consign.NYC")
  end

  # TEST ADMIN confirmation email following review
  def test_review_email(user, content, business)
    @user = user
    @content = content
    @business = business
    mail(:to => "test@test.com", :subject => "Your store has received a new review on Consign.NYC")
  end

  # CONSIGN.NYC email following user review
  def admin_review_email(user, content, business)
    @user = user
    @content = content
    @business = business
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Review on Consign.NYC")
  end

  # USER confirmation email following photo
  def new_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your photo has been uploaded on Consign.NYC")
  end

  # CONSIGN.NYC email following user review
  def admin_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Photo on Consign.NYC")
  end

  # CONSIGN.NYC email when message received
  def message_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Message from Consign.NYC")
  end

end
