class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games, :force => true do |t|
      t.integer :home_rerolls
      t.integer :away_rerolls
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_fans
      t.integer :away_fans
      t.integer :home_rerolls
      t.integer :away_rerolls
      t.integer :home_apothecaries
      t.integer :away_apothecaries
      t.timestamps
    end
    
    create_table :statuses, :force => true do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :x
      t.integer :y
      t.text :status
      t.text :injury_description
      t.timestamps
    end
    
    create_table :teams, :force => true do |t|
      t.integer :game_id
      t.integer :fumbbl_id
      t.string :name
      t.integer :rerolls
      t.integer :fan_factor
      t.integer :assistant_coaches
      t.integer :cheerleaders
      t.boolean :apothecary
      t.integer :user_id
      t.timestamps
    end
    
    create_table :actions, :force => true do |t|
      t.text :name
      t.text :offensive_skills_used
      t.text :associated_player_ids
      t.text :defensive_skills_used
      t.integer :game_id
      t.integer :turn
      t.integer :order
      t.integer :team_id
    end
    
    create_table :dice, :force => true do |t|
      t.integer :result
      t.integer :roll_type
      t.integer :action_id
    end
      

  end

  def self.down
    drop_table :games
    drop_table :teams
  end
end
