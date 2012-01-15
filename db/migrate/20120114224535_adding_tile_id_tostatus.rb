class AddingTileIdTostatus < ActiveRecord::Migration
  def up
    add_column :statuses, :tile_id, :integer
  end

  def down
    remove_column :statuses, :tile_id
  end
end
