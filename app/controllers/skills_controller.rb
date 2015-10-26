class SkillsController < ApplicationController
  before_action :require_login
  before_action :define_user
  
  def index
    @skills = Skill.all
  end
end
