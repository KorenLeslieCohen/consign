class SessionsController < ApplicationController

  # def new
  #   redirect_to '/auth/facebook'
  # end

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:current_user] = @user
    session[:user_id] = @user.id
    sign_in_and_redirect @user, :notice => "Congrats, you're logged in!" 
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url 
  end

  protected

    def auth_hash
      request.env['omniauth.auth'] 
    end

end
