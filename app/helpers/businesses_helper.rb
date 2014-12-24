module BusinessesHelper

  # Individual admin access for businesses
  def is_admin?
    if user_signed_in? 
      ((current_user.email == "consigndotnyc@gmail.com") || (current_user.email == @business.admin_email))
    end
  end

  # CONSIGN.NYC admin
  def is_owner?
    if user_signed_in?
      (current_user.email == "consigndotnyc@gmail.com")
    end
  end
    
end
