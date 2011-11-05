class Action < ActiveRecord::Base
  has_many :teams
  has_many :players, :through => :teams
  has_many :actions
  has_many :dice_rolls, :through => :actions
end
