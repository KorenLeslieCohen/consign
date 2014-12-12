class Mailer < ActionMailer::Base
  default from: "ConsignDotNYC@gmail.com"

  def new_review_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your review has been posted on Consign.NYC")
  end

  def admin_review_email(user, business)
    @user = user
    @business = business
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Review on Consign.NYC")
   end

  def new_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => @user.email, :subject => "Your photo has been uploaded on Consign.NYC")
   end

  def admin_photo_email(user, business)
    @user = user
    @business = business
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Photo on Consign.NYC")
  end

  def message_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(:to => "consigndotnyc@gmail.com", :subject => "New Message from Consign.NYC")
  end

end
