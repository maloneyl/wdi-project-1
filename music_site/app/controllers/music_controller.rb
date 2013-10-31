class MusicController < ApplicationController

load_and_authorize_resource

  def index
  end

  def show
    @music = Music.find(params[:id])
    @creator = User.find(@music.user_id)
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(params[:music])
    @music.user_id = current_user.id
    if @music.save
      redirect_to user_path(current_user), notice: 'Track saved!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @music = Music.find(params[:id])
    if @music.update_attributes(params[:music])
      redirect_to music_path(@music), notice: 'Track successfully updated!'
    else
      flash.now[:alert] = 'Track NOT updated!'
      render :edit
    end
  end

  def destroy
    @music = Music.find(params[:id])
    @user_id = @music.user_id
    @music.delete
    redirect_to user_path(@user_id)
  end

end
