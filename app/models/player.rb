class Player < ActiveRecord::Base
  include Blocking
  include Actions
  include MetaExtensions
  include Board
  belongs_to :team
  has_one :status
  serialize :skills
  attr_accessor :unused_skills
  
  def initialize(*args)
    super(*args)
    self.skills.map{|s| s.titlecase.gsub(" ", "")}.each do |skill|
      self.class_eval "include #{skill}"
    end
    self.unused_skills = self.skills.map(&:to_sym)
  end
  
  def start_action
  end
  
  def end_action
  end
  
  def game
    self.team.game
  end
  
  def use_skill(skill)
    self.unused_skills.delete(skill)
  end
  
  def gives_assists(target)
    return false unless self.adjacent?(target)
    return adjacent_players.select{|p| p.team != self.team} == [target]
  end
  
  def use_reroll(action, *args)
    game.use_reroll(self.team)
    self.send(action, *args)
  end

  def resolve_pass_action(target_square)
    
  end
  
  def resolve_move_action
    
  end
  
  def resolve_block_action(target)
    positive_assists = self.team.players.select{|p| p.gives_assists(target)}.size
    negative_assists = game.opposing_team(self).players.select{|p| p.gives_assists(self)}.size
    mod_str = self.st + positive_assists - negative_assists
    if mod_str < target.str.to_f/2
      return game.roll(:third_dice_block)
    elsif mod_str < target.str
      return game.roll(:half_dice_block)
    elsif mod_str == target.str
      return game.roll(:one_dice_block)
    elsif mod_str > target.str*2
      return game.roll(:two_dice_block)
    else mod_str > target.str
      return game.roll(:three_dice_block)
    end
  end
  
  def resolve_intercept_action
    
  end
  
  def get_hit
    
  end
  
end
