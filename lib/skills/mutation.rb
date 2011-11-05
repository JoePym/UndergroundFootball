module BigHand
  
end

module Claw
end

module Claws
  include Claw
end

module DisturbingPresence
  
end

module ExtraArms
  adds_to :pick_up, 1
  adds_to :catch, 1
  adds_to :intercept, 1
end

module FoulAppearance
  
end

module Horns
  
end

module PrehensileTail

end

module Tentacles
  
end

module TwoHeads
  
end

module VeryLongLegs
  adds_to :intercept, 1
end
