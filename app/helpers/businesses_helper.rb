module BusinessesHelper

    def is_admin?
      (user_signed_in? && (current_user.email == "consigndotnyc@gmail.com"))
      # ((@business.id == 2) && (current_user.email == "test@test.com"))
    end
    
end
