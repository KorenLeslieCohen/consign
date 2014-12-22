class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

   # should only be for admin for most of these

  def index
    redirect_to businesses_path unless is_owner?
    @messages = Message.all
  end

  def show
    # respond_with(@message)
    redirect_to businesses_path unless is_owner?
  end

  def new
    @message = Message.new
    # respond_with(@message)
  end

  def edit
    redirect_to businesses_path unless is_owner?
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.js   { }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.js   { render 'error' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Your message has been updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Your message was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end

    # CONSIGN.NYC admin
    def is_owner?
      (user_signed_in? && (current_user.email == "koren.cohen@gmail.com"))
    end
end