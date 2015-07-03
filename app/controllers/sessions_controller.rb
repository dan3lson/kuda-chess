class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Welcome back, #{user.username}!"
      redirect_to games_path
    else
      flash.now[:danger] = "Invalid email and / or password combination."
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Successfully logged out. See you again soon!"
    redirect_to root_path
  end
end
