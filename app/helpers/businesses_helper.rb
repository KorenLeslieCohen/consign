module BusinessesHelper

    def is_admin?
      (user_signed_in? && (current_user.email == "consigndotnyc@gmail.com") || (current_user.email == @business.admin_email))
    end
    
end
