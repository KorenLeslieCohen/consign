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

  def render_similar_businesses
    @businesses.each do |business|
      similar_businesses  = []
      if (business.neighborhood == @business.neighborhood) && (business.name != @business.name)
        similar_businesses << business
      end
      return similar_businesses
    end
  end
    
end

  
