class CreateDungeons < ActiveRecord::Migration
  def change
    create_table :dungeons do |t|
      t.integer :team_id
      t.string :name
      t.timestamps
    end
  end
end
