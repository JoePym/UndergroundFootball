class Tileset < ActiveRecord::Base
  has_many :tiles, :dependent => :destroy
  belongs_to :dungeon
end
