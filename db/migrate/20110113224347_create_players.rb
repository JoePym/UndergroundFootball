class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :st
      t.integer :ag
      t.integer :mv
      t.integer :av
      t.integer :spp
      t.text :skills
      t.text :injuries
      t.string :name
      t.string :position
      t.integer :team_id
      t.integer :fumbbl_id
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
