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
      format.js

    end
  end


  def create
    room = Room.find(params[:room_id])
    message = Message.new message_params
    message.username = username
    message.room = room
    if message.save
      respond_to do |format|
        format.html{
          redirect_to messages_path
        }
        format.js{
          render partial: 'create', locals: { message: message}
        }
      end
      #redirect_to room_messages_path(:room_id => room.id)

    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
