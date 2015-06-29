class MovesController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @moves = @game.moves
  end

  def new
    @game = Game.find(params[:game_id])
    @move = Move.new
  end

  def edit
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
      redirect_to @move
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
end
