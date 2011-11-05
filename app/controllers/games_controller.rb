class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end
  
  def create
    home_team = params[:home_team_url].match(/team_id=(\d*)/)[1]
    away_team = params[:away_team_url].match(/team_id=(\d*)/)[1]
    @game = Game.new
    @game.setup(Team.import(home_team), Team.import(away_team))
    if @game.save
      redirect_to :show
    else
      redirect_to :index
    end
  end
  
  def show
    
  end
end
