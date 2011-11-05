class Team < ActiveRecord::Base
  has_many :players
  belongs_to :game
  has_many :actions
  
 
  def player_ids
    Game.connection.select_values("select id from players where team_id = #{self.id}")
  end
  
  def active_players
    self.players.select{|p| p.active?}
  end
  
  def opposing_team
    self.game.opposing_team(self)
  end
  
  # def self.import(team_id)
  #   t = Team.find_or_create_by_fumbbl_id(team_id)
  #   doc = Nokogiri::XML(open("http://fumbbl.com/xml:team?id=#{team_id}"))
  #   t.name = doc.xpath('//team/name').children.to_s
  #   t.rerolls = doc.xpath('//team/reRolls').children.to_s
  #   t.fan_factor = doc.xpath('//team/fanFactor').children.to_s
  #   t.apothecary = doc.xpath('//team/apothecaries').children.to_s != "0"
  #   t.assistant_coaches = doc.xpath('//team/assistantCoaches').children.to_s
  #   t.cheerleaders = doc.xpath('//team/cheerleaders').children.to_s
  #   t.save!
  #   doc.xpath('//player').each do |player_stats|
  #     p = team.players.new()
  #     p.name = node.xpath("name").children.to_s
  #     p
  # end
end
