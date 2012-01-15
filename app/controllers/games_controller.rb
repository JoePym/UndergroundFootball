class GamesController < ApplicationController
  before_filter :set_game, :only => [:recieve_move, :show]

  def index
    @games = Game.all
  end
  
  def show
    @dungeon = current_user.teams.first.dungeon
    @team = current_user.teams.first
    @second_team = current_user.teams.first
  end
  
  def create
    @team = current_user.teams.first
    @second_team = current_user.teams.first
    new_game = current_user.games.create
    new_game.setup(@team, @second_team)
    redirect_to game_path(new_game)
  end

  def recieve_move
    tile = @game.home_team.dungeon.tiles.find(params[:location])
    @game.statuses.find(params[:player]).update_attributes(:status => "active", :tile =>tile)    
  end

  private 

  def set_game
    @game = current_user.games.find(params[:id])
  end
end
