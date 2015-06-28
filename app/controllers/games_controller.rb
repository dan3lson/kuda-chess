class GamesController < ApplicationController

  def index
    @games = Game.order("created_at ASC")
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
    @user = User.first
    @game = Game.new(game_params)
    @game.user = @user
    if @game.save
      flash[:success] = "Game created successfully."
      redirect_to games_path
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
      redirect_to games_path
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
end
