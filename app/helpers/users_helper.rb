module UsersHelper

  # CONSIGN.NYC admin
  def is_owner?
    (user_signed_in? && (current_user.email == "consigndotnyc@gmail.com"))
  end

  # Individual user edit for user
  def is_user?
    (user_signed_in? && (current_user.email == "consigndotnyc@gmail.com") || (current_user.email == @user.email))
  end
    
end
