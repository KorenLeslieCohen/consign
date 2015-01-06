module UsersHelper

  # CONSIGN.NYC admin
  def is_owner?
    if user_signed_in?
      (current_user.email == "consigndotnyc@gmail.com")
    end
  end

  # Individual user edit for user
  def is_user?
    if user_signed_in? 
      ((current_user.email == "consigndotnyc@gmail.com") || (current_user.email == @user.email))
    end
  end

  def is_profile_empty?
    ( !@user.city || @user.city == "") && ( !@user.tagline || @user.tagline == "") && ( !@user.url || @user.bio == "") && ( !@user.bio || @user.city == "")
  end
    
end
