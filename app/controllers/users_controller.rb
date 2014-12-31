class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this

  # GET /users
  # GET /users.json
  def index
    redirect_to businesses_path unless is_owner?
    @users = User.all
  end

  # # GET /users/1
  # # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    redirect_to businesses_path
  end

  # GET /users/1/edit
  def edit
    redirect_to businesses_path unless (is_owner? || is_user?)
  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User has been deleted.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :role, :last_name, :user_profile_photo, :url, :tagline, :city, :state, :age, :gender)
    end

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

end
