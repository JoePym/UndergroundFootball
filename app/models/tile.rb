class Tile < ActiveRecord::Base
  belongs_to :tileset
  has_one :status
end
