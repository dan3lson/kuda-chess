class GamesController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @games = Game.order("day DESC")
  end

  def show
    @game = Game.find(params[:id])
    @move = Move.new
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      flash[:success] = "Game created successfully."
      redirect_to @game
    else
      flash.now[:danger] = "Game not created successfully."
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:success] = "Game edited successfully."
      redirect_to @game
    else
      flash.now[:danger] = "Game not edited successfully."
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.destroy
      flash[:success] = "Game deleted successfully."
      redirect_to my_games_path
    else
      flash.now[:danger] = "Game not deleted."
      redirect_to game_path(@game)
    end
  end

  private
    def game_params
      params.require(:game).permit(
        :opponent_fname,
        :opponent_lname,
        :color,
        :result,
        :day
      )
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Yikes! Please log in first to do that."
        redirect_to login_url
      end
    end

    def correct_user
      @game = Game.find(params[:id])
      @user = @game.user
      unless current_user?(@user)
        flash[:danger] = "Yikes! That\'s not something you can do."
        redirect_to my_games_path
      end
    end
end
