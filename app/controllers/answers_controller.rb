class AnswersController < ApplicationController
  before_action :require_login
  before_action :define_user

  # Diary Form
  def new
    @answer = Answer.new

    QUESTION_CATEGORIES.each do |category|
      instance_variable = ("@" + category.pluralize).to_sym # :@urges
      instance_variable_set(instance_variable, Question.category(category))
    end
  end

  # Create answer records
  def create
    answer_array = answer_params[:answer]
    answer_array.each do |answer|
      @answer = Answer.create(answer)
    end

    render nothing: true
  end

private

    def answer_params
      params.permit(:answer => [:date, :num, :text, :bool, :question_id, :user_id])
    end
    
end
