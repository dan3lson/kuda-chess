class MovesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @game = Game.find(params[:game_id])
    @moves = @game.moves
  end

  def new
    @game = Game.find(params[:game_id])
    @move = Move.new
  end

  def edit
    @game = Game.find(params[:game_id])
    @move = Move.find(params[:id])
  end

  def create
    @game = Game.find(params[:game_id])
    @move = Move.new(move_params)
    @move.game = @game
    if @move.save
      flash[:success] = "Move successfully added."
      redirect_to @game
    else
      flash[:danger] = "Move not successfully added."
      render "games/show"
    end
  end

  def update
    @game = Game.find(params[:game_id])
    @move = Move.find(params[:id])

    if @move.update(move_params)
      flash[:success] = "Move edited successfully."
      redirect_to @game
    else
      flash.now[:danger] = "Move not edited successfully."
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @move = Move.find(params[:id])
    if @move.destroy
      flash[:success] = "Move deleted successfully."
      redirect_to game_path(@game)
    else
      flash.now[:danger] = "Move not deleted."
      redirect_to game_path(@game)
    end
  end

  private
    def move_params
      params.require(:move).permit(:white, :black)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Yikes! Please log in first to do that."
        redirect_to login_url
      end
    end

    def correct_user
      @game = Game.find(params[:game_id])
      @move = Move.find(params[:id])
      @user = @game.user
      unless current_user?(@user)
        flash[:danger] = "Yikes! That\'s not something you can do."
        redirect_to my_games_path
      end
    end
end
