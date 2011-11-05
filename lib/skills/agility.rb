module Catch
  rerolls :catch
  rerolls :intercept
end

module DivingCatch
  
end

module Dodge
  rerolls :dodge
end

module DivingTackle
  
end

module Sidestep
  
end

module Leap
  
end

module SureFeet
  rerolls :go_for_it
end

module SneakyGit
  
end

module Sprint
  def go_for_it
    if self.unused_skills.include?(:sprint)
      self.use_skill(:sprint)
      return game.roll > game.gfi_target ? :success : :fail
    else
      self.remaining_gfis -= 1
      return game.roll > game.gfi_target ? :success : :fail
    end
  end
end

module JumpUp
  
end