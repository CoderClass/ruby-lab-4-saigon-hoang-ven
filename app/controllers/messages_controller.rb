class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @messages = @room.messages
  end


  def create
    room = Room.find(params[:room_id])
    message = Message.new message_params
    message.room = room
    if message.save
      redirect_to room_messages_path(:room_id => room.id)
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:username, :content)
  end
end
