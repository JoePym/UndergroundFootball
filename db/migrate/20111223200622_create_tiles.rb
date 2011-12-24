class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.integer :tileset_id
      t.integer :x
      t.integer :y
      t.timestamps
    end
  end
end
