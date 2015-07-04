class CurrentUserGamesController < ApplicationController
  def index
    if logged_in?
      @current_user_games = current_user.games
    end
  end
end
