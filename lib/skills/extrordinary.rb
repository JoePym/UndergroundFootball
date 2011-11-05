module AlwaysHungry
  
end

module Animosity
  
end

module BallAndChain
  
end

module Bloodlust
  
end

module Bombadier
  
end

module BoneHead
  def start_action
    end_action if game.roll == 1
  end
end

module Chainsaw
  
end

module Decay
  
end

module FanFavourite
  
end

module HypnoticGaze
  
end

module Loner
  
  def use_reroll(action, *args)
    game.use_reroll(self.team)
    if game.roll > 3
      self.send(action, *args)
    end
  end
end

module NoHands
  def intercept(*args)
    :fail
  end
  
  def catch(*args)
    :fail
  end
  
  def pick_up(*args)
    :fail
  end
end

module NurglesRot
  
end

module ReallyStupid
  
end

module Regeneration
  
end

module RightStuff
  
end

module SecretWeapon
  
end

module Stab
  
end

module Stakes
  
end

module Stunty
  
end

module TakeRoot
  
end

module ThrowTeamMate
  
end

module Titchy
  adds_to :dodge, 1
end

module WildAnimal
  
end
