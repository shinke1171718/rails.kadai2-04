class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:update,:set_room,:room_params,:img_params]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.new
  end

  def create
    binding.pry
    @room = current_user.rooms.new(params(:room), permit(:name, :user_id, :introduction, :price, :address))
    if @room.save
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


  def img_params
    params.require(:post).permit(:text, :image)
  end

end
