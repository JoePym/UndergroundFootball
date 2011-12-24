class Dungeon < ActiveRecord::Base
  has_many :tilesets, :dependent => :destroy
  has_many :tiles, :through => :tilesets
  belongs_to :team
  
  after_create :setup_dungeon
  
  def setup_dungeon
    home_endzone = self.tilesets.create(:description => "The home team endzone!", :name => "EndZone")
    (0..4).each do |y|
      (0..1).each do |x|
        home_endzone.tiles.create(:x => x, :y => y+2)
      end
    end
    top_passage = self.tilesets.create(:description => "The top passage", :name => "Passage")
    (0..1).each do |y|
      (0..21).each do |x|
        top_passage.tiles.create(:x => x + 1 , :y => y)
      end
    end
    bottom_passage = self.tilesets.create(:description => "The bottom passage", :name => "Second Passage")
    (0..1).each do |y|
      (0..21).each do |x|
        bottom_passage.tiles.create(:x => x + 1 , :y => y + 6)
      end
    end
    away_endzone = self.tilesets.create(:description => "The away team endzone!", :name => "EndZone")
    (0..4).each do |y|
      (0..1).each do |x|
        home_endzone.tiles.create(:x => x + 22, :y => y+2)
      end
    end
  end
  
  def max_x
    self.tiles.maximum("x")
  end
  
  def max_y
    self.tiles.maximum("y")
  end

end
