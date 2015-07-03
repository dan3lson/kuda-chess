class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.order("username")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to Kuda, #{@user.username}!"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Changes successfully made."
      redirect_to @user
    else
      flash[:danger] = "Changes not successfully made."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Yikes! Please log in first to do that."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    puts "\nCURRENT USER #{current_user.id}\n\n"
    puts "\n@USER #{@user.id}\n\n"
    puts "\nCURRENT USER??? #{current_user?(@user)}\n\n"
    unless current_user?(@user)
      binding.pry
      flash[:danger] = "Yikes! That\'s not something you can do."
      redirect_to root_path
    end
  end
end
