module Actions
  
  def dodge(target_square)
    @dodge_modifiers ||= []
    @dodge_modifiers << 1
    @dodge_modifiers << 0 - game.get_tackle_zones(self.opposing_team, target_square)
    roll = game.roll(:d6)
    result = :fail
    if self.agility_test(roll, dodge_modifiers)
      result = :success
    end
    @dodge_modifiers = []
    result
  end
  
  def agility_test(roll, modifiers)
    return false if roll == 1
    return true if roll == 6
    return (roll + modifiers.sum > 6 - self.ag)
  end
  
  def tackle_zones_for_ball_handling
    0 - game.get_tackle_zones_on(self)
  end


  def intercept
    @intercept_modifiers ||= []
    @intercept_modifiers << -2
    @intercept_modifiers << tackle_zones_for_ball_handling
    roll = game.roll(:d6)
    result = :fail
    puts @intercept_modifiers.inspect
    if self.agility_test(roll, @intercept_modifiers)
      result = :success
    end
    @intercept_modifiers = nil
    result
  end
  
  def catch(accurate_pass)
    @catch_modifiers ||= []
    @catch_modifiers << (accurate_pass ? 1 : 0)
    @catch_modifiers << tackle_zones_for_ball_handling
    roll = game.roll
    result = :fail
    if self.agility_test(roll, @catch_modifiers)
      result = :success
    end
    @catch_modifiers = []
    result
  end
  
  def pick_up
    @pick_up_modifiers ||= []
    @pick_up_modifiers << 1
    @pick_up_modifiers << 0 - game.get_tackle_zones(self.opposing_team, square)
    roll = game.roll(:d6)
    result = :fail
    if self.agility_test(roll, pick_up_modifiers)
      result = :success
    end
    @pick_up_modifiers = []
    result
  end
  
  def get_pass_bracket(target_square)
    #http://fumbbl.com/index.php?name=PNphpBB2&file=viewtopic&t=16209&postdays=0&postorder=asc&start=30 ramonsalazar is a god
    self.distance(target_square)
    return :quick if length < 3.93
    return :short if length < 7.42
    return :long_pass if length < 10.92
    return :long_bomb if length < 13.65
  end
  
  def pass(target_square)
    @pass_modifiers ||= []
    get_pass_bracket(target_square)
    range = self.distance(target_square)
    case get_pass_bracket(target_square)
    when :quick
      @pass_modifiers << 1
    when :short
      @pass_modifiers << 0
    when :long
      @pass_modifiers << -1
    when :long_bomb
      @pass_modifiers << -2
    end
    @pass_modifiers << tackle_zones_for_ball_handling
    roll = game.roll
    result = :fail
    if (6 - self.ag + modifiers.sum) < 1
      result = :fumble
    else
      result = :fail
      if self.agility_test(roll, @pass_modifiers)
        result = :success
      end
    end
    @pass_modifiers = []
    result
  end
  
  def go_for_it
    self.remaining_gfis -= 1
    game.roll > game.gfi_target ? :success : :fail
  end
end