class RoomsController < ApplicationController
  def index
    @rooms = Room.all
      @room = Room.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def show
    redirect_to room_messages_path(:room_id => params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
