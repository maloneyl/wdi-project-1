class MusicController < ApplicationController

  load_and_authorize_resource except: [:index]

  def index
    page = params[:page] || 1
    @music = Music.paginate(page: page, per_page: 10).order(:created_at).all
    authorize! :read, @music
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
