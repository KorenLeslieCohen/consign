class BiztagsController < ApplicationController
  before_action :set_biztag, only: [:show, :edit, :update, :destroy]

  # GET /biztags
  # GET /biztags.json
  def index
    redirect_to businesses_path unless is_owner?
    @biztags = Biztag.all.order('name ASC')
  end

  # GET /biztags/1
  # GET /biztags/1.json
  def show
    redirect_to businesses_path unless is_owner?
    @biztag = Biztag.find(params[:id])
  end

  # GET /biztags/new
  def new
    redirect_to businesses_path unless is_owner?
    @biztag = Biztag.new
  end

  # GET /biztags/1/edit
  def edit
    redirect_to businesses_path unless is_owner?
  end

  # POST /biztags
  # POST /biztags.json
  def create
    @biztag = Biztag.new(biztag_params)

    respond_to do |format|
      if @biztag.save
        format.html { redirect_to @biztag, notice: 'Biztag was successfully created.' }
        format.json { render :show, status: :created, location: @biztag }
      else
        format.html { render :new }
        format.json { render json: @biztag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biztags/1
  # PATCH/PUT /biztags/1.json
  def update
    respond_to do |format|
      if @biztag.update(biztag_params)
        format.html { redirect_to @biztag, notice: 'Biztag was successfully updated.' }
        format.json { render :show, status: :ok, location: @biztag }
      else
        format.html { render :edit }
        format.json { render json: @biztag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biztags/1
  # DELETE /biztags/1.json
  def destroy
    @biztag.destroy
    respond_to do |format|
      format.html { redirect_to biztags_url, notice: 'Biztag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biztag
      @biztag = Biztag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biztag_params
      params.require(:biztag).permit(:name)
    end

    # CONSIGN.NYC admin
    def is_owner?
      if user_signed_in?
        (current_user.email == "consigndotnyc@gmail.com")
      end
    end
end
