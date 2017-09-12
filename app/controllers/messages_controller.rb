class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.email
      redirect_to chat_room_path(params[:chat_room_id])
    else
      redirect_to chat_room_path(params[:chat_room_id])
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chat_room_id)
    end
end
