class Module
  attr_accessor :uses_rerolls, :uses_adds_to
  alias_method :old_append_features, :append_features
  
  
  def adds_to(skill, number)
    self.uses_adds_to ||= []
    self.uses_adds_to << [skill, number]
  end
  
  def rerolls(skills)
    self.uses_rerolls ||= []
    self.uses_rerolls += [skills].flatten
  end
  
  def append_features(mod)
    self.uses_rerolls ||= []
    self.uses_adds_to ||= []
    self.uses_adds_to.each do |skill, number| 
      mod.class_eval %Q{
        alias_method :#{chained_skill_name(skill)}, :#{skill}
        define_method :#{skill} do |*args|
          @#{skill.to_s.tableize.singularize}_modifiers = [#{number}]
          self.send(:#{chained_skill_name(skill)}, *args)
        end
      }
    end
    self.uses_rerolls.each do |skill| 
      mod.class_eval %Q{
        alias_method :#{chained_skill_name(skill)}, :#{skill}
        define_method :#{skill} do |*args|
          result = self.send(:#{chained_skill_name(skill)}, *args)
          self.unused_skills.include?(:#{modifying_skill})
          if result == :fail && self.unused_skills.include?(:#{modifying_skill})
            self.use_skill(:#{modifying_skill})
            result = self.send(:#{skill}, *args)
          end
          result
        end
      }
    end    
    old_append_features(mod)
  end
  
  def modifying_skill
    self.name.to_s.split("::").last.downcase
  end

  def chained_skill_name(skill)
    "old_#{skill}_from_#{modifying_skill}".to_sym
  end
end
require 'skills/agility'
require 'skills/extrordinary'
require 'skills/general'
require 'skills/mutation'
require 'skills/passing'
require 'skills/strength'