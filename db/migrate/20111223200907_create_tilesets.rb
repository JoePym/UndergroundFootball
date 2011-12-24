class CreateTilesets < ActiveRecord::Migration
  def change
    create_table :tilesets do |t|
      t.integer :dungeon_id
      t.string :name
      t.text :description
      t.string :tile_type
      t.timestamps
    end
  end
end
