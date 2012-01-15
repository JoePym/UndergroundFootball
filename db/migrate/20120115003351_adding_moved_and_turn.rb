class AddingMovedAndTurn < ActiveRecord::Migration
  def up
    add_column :games, :turn, :integer
    add_column :statuses, :moved, :boolean, :default => false, :null => false
  end

  def down
    remove_column :games, :turn
    remove_column :statuses, :moved
  end
end
