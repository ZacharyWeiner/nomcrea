class ChatRoomsController < ApplicationController
  layout 'theme'
  def show
    @chatroom = ChatRoom.find(params[:id])
    @message = Message.new
  end

end
