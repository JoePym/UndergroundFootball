class Dungeon < ActiveRecord::Base
  has_many :tiles
  belongs_to :team
end
