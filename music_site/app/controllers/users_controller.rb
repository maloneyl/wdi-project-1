class UsersController < ApplicationController

  load_and_authorize_resource except: [:index]

  def index
    page = params[:page] || 1
    @users = User.paginate(page: page, per_page: 10).order(:created_at).all
    authorize! :read, @users
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    if current_user
      redirect_to user_path(current_user), notice: "You already have an account! Check this out..."
      return
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_profile_path, notice: "Thanks for signing up!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path, notice: 'User was successfully updated!'
    else
      flash.now[:alert] = 'User was NOT updated!'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

end
