class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @rooms.save
      redirect_to "/rooms/#{@room.id}",notice: "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
      render :new
    end
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room),permit(:name,:introduction,:price,:address))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to "/rooms/#{@room.id}"
    else
      render "edit"
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
  end

end
