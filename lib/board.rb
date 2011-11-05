module Board
  Square = Struct.new(:x, :y)
  
  def active?
    [:prone, :stunned, :standing].include?(self.status.status.to_sym)
  end
  
  def square
    Square.new(self.status.x, self.status.y)
  end
  
  def distance(square)
    Math.sqrt((square.x - self.status.x)**2 + (square.y - self.status.y)**2)
  end
  
  def adjacent?(player)
    [(player.status.x - self.status.x).abs, (player.status.y - self.status.y).abs].max == 1
  end
  
  def gives_assist_against(player)
    return false if self.distance(player.square) >= 2
  end
  
  def adjacent_players
    game.teams.map(&:players).flatten.select{|p| p.adjacent?(x)}
  end
end