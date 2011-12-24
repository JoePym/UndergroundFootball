class AddingRaceToTeams < ActiveRecord::Migration
  def up
    add_column :teams, :race_id, :integer
  end

  def down
    remove_column :teams, :race_id
  end
end
