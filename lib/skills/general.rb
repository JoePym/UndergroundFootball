module Block
  def both_down
    target.hit(self)
    self.hit(target)
    self.game.set_prone(self)
    self.game.set_prone(target)
  end
end

module DirtyPlayer
  
end

module Frenzy
  
end

module Kick
  
end

module Dauntless
  
end

module Shadowing
  
end

module StripBall
  
end

module Tackle
  
end

module SureHands
  
end

module Pro
  
end

module Fend
  
end

module Wrestle
  
end

module KickoffReturn
  
end