module Blocking
  
  def recieve_pow(target)
    self.push
    game.set_prone(self)
    if target.break_armour_on(self) == :break
      target.injure(self)
    end
  end
  
  def recieve_push_pow(target)
    self.push
    game.set_prone(self)
    if target.break_armour_on(self) == :break
      target.injure(self)
    end
  end
  
  def recieve_pushback(target)
    self.push
  end
  
  def recieve_both_down(target)
    game.set_prone(self)
    if target.break_armour_on(self) == :break
      target.injure(self)
    end
  end
  
  def recieve_skull(target)
  end
  
  def throw_pow
  end
  
  def throw_push_pow
  end
  
  def throw_pushback
  end
  
  def throw_both_down
    game.set_prone(self)
    if target.break_armour_on(self) == :break
      target.injure(self)
    end
  end
  
  def throw_skull
    game.set_prone(self)
    if target.break_armour_on(self) == :break
      target.injure(self)
    end
  end
end