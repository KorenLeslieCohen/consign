class BoroughsController < ApplicationController
  before_action :set_borough, only: [:show, :edit, :update, :destroy]

  # GET /boroughs
  # GET /boroughs.json
  def index
    @boroughs = Borough.all
  end

  # GET /boroughs/1
  # GET /boroughs/1.json
  def show
  end

  # GET /boroughs/new
  def new
    @borough = Borough.new
  end

  # GET /boroughs/1/edit
  def edit
  end

  # POST /boroughs
  # POST /boroughs.json
  def create
    @borough = Borough.new(borough_params)

    respond_to do |format|
      if @borough.save
        format.html { redirect_to @borough, notice: 'Borough was successfully created.' }
        format.json { render :show, status: :created, location: @borough }
      else
        format.html { render :new }
        format.json { render json: @borough.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boroughs/1
  # PATCH/PUT /boroughs/1.json
  def update
    respond_to do |format|
      if @borough.update(borough_params)
        format.html { redirect_to @borough, notice: 'Borough was successfully updated.' }
        format.json { render :show, status: :ok, location: @borough }
      else
        format.html { render :edit }
        format.json { render json: @borough.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boroughs/1
  # DELETE /boroughs/1.json
  def destroy
    @borough.destroy
    respond_to do |format|
      format.html { redirect_to boroughs_url, notice: 'Borough was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borough
      @borough = Borough.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borough_params
      params.require(:borough).permit(:name)
    end
end
