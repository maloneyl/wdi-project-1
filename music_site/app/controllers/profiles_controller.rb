class ProfilesController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def show # tested, works!
    @user_id = Profile.find(params[:id]).user_id # find user_id of that profile, not of current user
    redirect_to user_path(@user_id)
  end

  def new # need to make sure each user only has one profile
    @user = User.find(current_user.id)
    if @user.profile.nil?
      @profile = Profile.new
      list_web_safe_fonts
    else
      redirect_to user_path(@user), notice: 'You already have a profile! Check this out...'
    end
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = @current_user.id
    if @profile.save
      redirect_to user_path(@current_user), notice: 'Profile saved!'
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find_by_user_id(@current_user.id)
    list_web_safe_fonts
  end

  def update
    @profile = Profile.find_by_user_id(current_user.id)
    if @profile.update_attributes(params[:profile])
      redirect_to user_path(current_user), notice: 'Profile successfully updated!'
    else
      flash.now[:alert] = 'Profile NOT updated!'
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to user_path(@current_user), notice: 'Profile removed!'
  end

  def list_web_safe_fonts
    @available_fonts = [ 'Arial', 'Helvetica', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Georgia', 'Impact', 'Lucida Console', 'Monaco', 'Lucida Sans Unicode', 'Lucida Grande', 'Palatino Linotype', 'Book Antiqua', 'Palatino', 'Tahoma', 'Geneva', 'Times New Roman', 'Times', 'Trebuchet MS', 'Verdana' ]
  end

end
