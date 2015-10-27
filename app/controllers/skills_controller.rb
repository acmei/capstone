class SkillsController < ApplicationController
  before_action :define_user

  SKILL_CATEGORIES = ['mindfulness', 'ER', 'IE', 'DT']
  
  def index
    SKILL_CATEGORIES.each do |category|
      instance_variable = ("@" + category).to_sym # :@mindfulness
      instance_variable_set(instance_variable, Skill.category(category))
    end
  end
end
