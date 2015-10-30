class SkillsController < ApplicationController
  before_action :define_user

  SKILL_CATEGORIES = ['mindfulness', 'ER', 'IE', 'DT']
  
  def index
    SKILL_CATEGORIES.each do |category|
      instance_variable = ("@" + category).to_sym # :@mindfulness
      instance_variable_set(instance_variable, Skill.category(category))
    end
  end

  def favorite
    skill_id = params[:skill][:id]
    skill = Skill.find_by(id: skill_id)
    @favorite = @user.skills.include?(skill)
    unless @favorite
      @user.skills << skill
      @user.save
    end

    render nothing: true
  end

  private

    def skill_params
      params.require(:skill).permit(:id, :user_id)
    end
end
