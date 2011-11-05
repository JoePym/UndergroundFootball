class Game < ActiveRecord::Base
  has_many :teams
  has_many :actions
  has_many :statuses
  
  def setup(home, away)
    self.home_rerolls = home.rerolls
    self.away_rerolls = away.rerolls
    self.home_team_id = home.id
    self.away_team_id = away.id
    # self.home_fans = self.roll + self.roll + home.fan_factor
    #     self.away_fans = self.roll + self.roll + away.fan_factor
    self.home_apothecaries = home.apothecary ? 1 : 0
    self.away_apothecaries = away.apothecary ? 1 : 0
    home.player_ids.each{|player_id| self.statuses.create(:player_id => player_id, :status => :reserve)}
    away.player_ids.each{|player_id| self.statuses.create(:player_id => player_id, :status => :reserve)}
    self.save
  end
  
  def roll
    
  end
  
  def get_tackle_zones(team, square)
    coordinate_set = team.active_players.map{|p| p.square}
    coordinate_set.map{|coord| (square.x - coord.x)**2 + (square.y - coord.y)**2 }.select{|dist| dist <= 2}.size
  end
  
  def get_tackle_zones_on(player)
    get_tackle_zones(player.team, player.square)
  end
  
  def opposing_team(player)
    if home.player_ids.include?(player.id)
      away_team
    else
      home_team
    end
  end
  
  def home_team
    Team.find(home_team_id)
  end
  
  def away_team
    Team.find(away_team_id)
  end
end
