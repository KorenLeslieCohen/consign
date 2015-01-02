module BiztagsHelper

  # CONSIGN.NYC admin
  def is_owner?
    if user_signed_in?
      (current_user.email == "consigndotnyc@gmail.com")
    end
  end
  
end
