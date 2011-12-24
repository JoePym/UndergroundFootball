class Dungeon < ActiveRecord::Base
  has_many :tilesets, :dependent => :destroy
  has_many :tiles, :through => :tilesets
  belongs_to :team
  
  after_create :setup_dungeon
  
  def setup_dungeon
    home_endzone = self.tilesets.create(:description => "The home team endzone!", :name => "EndZone")
    (0..4).each do |y|
      (0..1).each do |x|
        home_endzone.tiles.create(:x => x, :y => y)
      end
    end
    top_passage = self.tilesets.create(:description => "The top passage", :name => "Passage")
    (0..1).each do |y|
      (0..5).each do |x|
        top_passage.tiles.create(:x => x + 2 , :y => y)
      end
    end
    bottom_passage = self.tilesets.create(:description => "The bottom passage", :name => "Second Passage")
    (0..1).each do |y|
      (0..5).each do |x|
        bottom_passage.tiles.create(:x => x + 2 , :y => y + 3)
      end
    end
    away_endzone = self.tilesets.create(:description => "The away team endzone!", :name => "EndZone")
    (0..4).each do |y|
      (0..1).each do |x|
        home_endzone.tiles.create(:x => x + 8, :y => y)
      end
    end
    stubs = self.tilesets.create(:description => "stub", :name => "Stone", :stub => true)
    self.tiles.maximum("x").times do |x|
      self.tiles.maximum("y").times do |y|
        stubs.tiles.create(:x => x, :y => y) unless self.tiles.where(:x => x, :y => y).count > 0
      end
    end 
  end

end
