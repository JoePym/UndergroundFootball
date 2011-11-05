module BreakTackle
  def append_features(mod)
    alias_method :old_dodge_from_break_tackle, :dodge
  
    def dodge(*args)
      current_ag = self.ag
      if self.unused_skills.include?(:break_tackle)
        self.unused_skills << :break_tackle
        self.ag = [self.ag, self.st].max
      end
      return_value = old_dodge_from_break_tackle(*args)
      self.ag = current_ag
      return_value
    end
  end
end

module Grab
  
end

module Guard
  def gives_assists
    return self.adjacent?(target)
  end
end

module Juggernaut
  
end

module MightyBlow
  
end

module MultipleBlock
  
end

module PilingOn
  
end

module StandFirm
  
end

module StrongArm
  def append_features(mod)
    alias_method :old_get_pass_bracket_from_strong_arm, :get_pass_bracket
  
    def get_pass_bracket(*args)
      result = old_get_pass_bracket_from_strong_arm(*args)
      case result
      when :quick
        return :quick
      when :short
        return :quick
      when :long
        return :short
      when :long_bomb
        return :long
      end
    end
    super(mod)
  end
end

module ThickSkull
  
end
