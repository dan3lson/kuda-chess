class CurrentUserGamesController < ApplicationController
  def index
    if logged_in?
      @current_user_games = current_user.games
    end
  end
end

# You should be able to let the default behavior
# be a current_user's games rather than have this
# controller. I would try to refactor a bit to
# include that logic in the GamesController instead
# of here, thereby eliminating the need for this one.
# Basically this would go into the Games Controller
# index method:
# if user is logged in, then games = current_user.games
# else @games = Game.order("day DESC")
# You could then also have a filter that lets the
# current user choose all games that updates that their
# view accordingly.
