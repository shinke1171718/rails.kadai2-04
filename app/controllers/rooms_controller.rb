class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:update,:set_room,:room_params,:img_params]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @rooms.save
    pry-rails
      redirect_to "/rooms/#{@room.id}",notice: "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
      render :new
    end
  end

  def show
    @user = current_user
    @room = Room.find_by(id:params[:id])
    unless @room
      render 'shared/404', status: 404
    end
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

  def img_params
    params.require(:post).permit(:text, :image)
  end

end
