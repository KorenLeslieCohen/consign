class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    redirect_to "/businesses" unless is_owner?
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    redirect_to "/businesses" unless is_owner?
  end

  # GET /reviews/new
  def new
    redirect_to "/businesses" unless is_owner?
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    redirect_to "/businesses" unless is_owner?
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.business, notice: 'Review was successfully created.' }
        format.js   { } 
        format.json { render :show, status: :created, location: @review }
      else
        format.html { }
        format.js   { render 'error' } 
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.user, notice: 'Your review has been deleted.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:business_id, :user_id, :rating, :content, :role)
    end

    # CONSIGN.NYC admin
    def is_owner?
      if user_signed_in?
        (current_user.email == "consigndotnyc@gmail.com")
      end
    end
end
