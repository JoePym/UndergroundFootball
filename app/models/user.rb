class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :teams
  after_create :setup_team
  
  def setup_team
    orc_team = self.teams.new(:race_id => 57, :apothecary => true, :rerolls => 4, :name => "Green n Meen")
    orc_team.save!
    orc_team.players.create(:position => "Troll", :st => 5, :ag => 1, :mv => 4, :av => 9, :spp => 0,
                      :skills => ["Loner", "Always Hungry", "Mighty Blow", "Really Stupid", "Regeneration", "Throw Team-Mate"])
    orc_team.players.create(:position => "Black Orc Blocker", :st => 4, :ag => 2, :mv => 4, :av => 9, :spp => 6,
                      :skills => ["Guard"])
    orc_team.players.create(:position => "Black Orc Blocker", :st => 4, :ag => 2, :mv => 4, :av => 9, :spp => 6,
                      :skills => ["Stand Firm"])
    orc_team.players.create(:position => "Black Orc Blocker", :st => 4, :ag => 2, :mv => 4, :av => 9, :spp => 0,
                      :skills => [])
    orc_team.players.create(:position => "Black Orc Blocker", :st => 4, :ag => 2, :mv => 4, :av => 9, :spp => 0,
                      :skills => [])
    orc_team.players.create(:position => "Blitzer", :st => 3, :ag => 3, :mv => 6, :av => 9, :spp => 6,
                      :skills => ["Block", "Frenzy"])
    orc_team.players.create(:position => "Blitzer", :st => 3, :ag => 3, :mv => 6, :av => 9, :spp => 6,
                      :skills => ["Block", "Strip Ball"])
    orc_team.players.create(:position => "Blitzer", :st => 3, :ag => 3, :mv => 6, :av => 9, :spp => 6,
                      :skills => ["Block", "Mighty Blow", "Tackle"])
    orc_team.players.create(:position => "Blitzer", :st => 3, :ag => 3, :mv => 6, :av => 9, :spp => 0,
                      :skills => ["Block"])
    orc_team.players.create(:position => "Thrower", :st => 3, :ag => 3, :mv => 5, :av => 7, :spp => 0,
                      :skills => [ "Pass", "Sure Hands" ])
    orc_team.players.create(:position => "Thrower", :st => 3, :ag => 3, :mv => 5, :av => 7, :spp => 0,
                      :skills => [ "Pass", "Sure Hands", "Kickoff Return"])
    orc_team.players.create(:position => "Goblin", :st => 2, :ag => 3, :mv => 6, :av => 7, :spp => 0,
                      :skills => [ "Dodge", "Right Stuff", "Stunty" ])
    orc_team.players.create(:position => "Lineman", :st => 3, :ag => 3, :mv => 5, :av => 9, :spp => 0,
                       :skills => [])
    orc_team.players.create(:position => "Lineman", :st => 3, :ag => 3, :mv => 5, :av => 9, :spp => 0,
                      :skills => [])                  
  end
end
