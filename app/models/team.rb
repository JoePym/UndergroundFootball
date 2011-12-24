class Team < ActiveRecord::Base
  has_many :players, :dependent => :destroy
  belongs_to :game
  has_many :actions
  has_one :dungeon, :dependent => :destroy
  
  after_create :create_dungeon
  
  def create_dungeon
    Dungeon.create(:team_id => self.id, :name => "Home O' Mork")
  end
 
  def player_ids
    Game.connection.select_values("select id from players where team_id = #{self.id}")
  end
  
  def active_players
    self.players.select{|p| p.active?}
  end
  
  def opposing_team
    self.game.opposing_team(self)
  end
  
  def race
    case race_id
    when 41 
      "Amazon"
    when 42 
      "Chaos"
    when 43
      "Chaos Dwarf"
    when 64 
      "Chaos Pact"
    when 44 
      "Dark Elf"
    when 45 
      "Dwarf"
    when 46 
      "Elf"
    when 47 
      "Goblin"
    when 48 
      "Halfling"
    when 49 
      "High Elf"
    when 50 
      "Human"
    when 51 
      "Khemri"
    when 52 
      "Lizardman"
    when 53 
      "Necromantic"
    when 54 
      "Norse"
    when 55 
      "Nurgle"
    when 56 
      "Ogre"
    when 57 
      "Orc"
    when 58 
      "Skaven"
    when 65 
      "Slann"
    when 59 
      "Undead"
    when 66 
      "Underworld"
    when 60 
      "Vampire"
    when 61 
      "Wood Elf"
    end
  end
 
end
