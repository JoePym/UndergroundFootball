module MetaExtensions
  def self.rerolls(skill)
    alias_method Player.chained_skill_name(skill), skill.to_sym
    define_method skill.to_sym do |*args|
      result = self.send(Player.chained_skill_name(skill), *args)
      if result == :fail && self.unused_skills.include?(skill.to_sym)
        self.use_skill(skill)
        result = self.send(Player.chained_skill_name(skill), *args)
      end
      result
    end
  end
  
  def self.modifying_skill
    puts self.class.name.to_s.split("::").inspect
    self.class.name.to_s.split("::").last.downcase
  end
  
  def self.chained_skill_name(skill)
    "old_#{skill}_from_#{modifying_skill}".to_sym
  end
  
  def self.adds_to(skill, number)
    
  end
  
end