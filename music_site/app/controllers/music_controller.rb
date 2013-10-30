class MusicController < ApplicationController

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
  end

  def destroy
    @music = Music.find(params[:id])
    @user_id = @music.user_id
    @music.delete
    redirect_to user_path(@user_id)
  end

end
