class ChatMessagesController < ApplicationController
  before_action :set_chat_message, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :json

  def index
    @chat_messages = ChatMessage.all
    respond_with(@chat_messages)
  end

  def show
    respond_with(@chat_message)
  end

  def new
    @chat_message = ChatMessage.new
    respond_with(@chat_message)
  end

  def edit
  end

  def create
    @chat_message = current_user.chat_messages.create(chat_message_params)
    flash[:notice] = 'ChatMessage was successfully created.' if @chat_message.save
    respond_with(@chat_message)
  end

  def update
    flash[:notice] = 'ChatMessage was successfully updated.' if @chat_message.update(chat_message_params)
    respond_with(@chat_message)
  end

  def destroy
    @chat_message.destroy
    respond_with(@chat_message)
  end

  private
    def set_chat_message
      @chat_message = ChatMessage.find(params[:id])
    end

    def chat_message_params
      params.require(:chat_message).permit(:body, :user_id)
    end
end
