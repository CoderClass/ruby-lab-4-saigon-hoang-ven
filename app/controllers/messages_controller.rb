class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @messages = @room.messages

    respond_to do |format|
      format.html {
        render 'index'
      }
      format.json {
        render json:@messages
      }

    end
  end


  def create
    room = Room.find(params[:room_id])
    message = Message.new message_params
    message.room = room
    if message.save
      #redirect_to room_messages_path(:room_id => room.id)
      render partial: 'create', locals: { message: message}
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:username, :content)
  end
end
