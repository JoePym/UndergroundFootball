class AddingUserIdToGames < ActiveRecord::Migration
  def up
    add_column :games, :user_id, :integer
  end

  def down
    drop_column :games, :user_id
  end
end
