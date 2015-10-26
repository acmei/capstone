class AnswersController < ApplicationController
  before_action :require_login
  before_action :define_user

  # Display diary(s)
  def show; end

  # Add a new diary
  def new
    @answer = Answer.new

    QUESTION_CATEGORIES.each do |category|
      instance_variable = ("@" + category.pluralize).to_sym # :@urges
      instance_variable_set(instance_variable, Question.category(category))
    end
  end

  def create
    raise
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to new_answer_path
    else
      render new_answer_path
    end
  end

  # Edit an existing diary
  def edit; end

  def update
    @diary.update(diary_params)

    redirect_to user_path
  end

  # Delete a diary
  def destroy
    @diary.destroy

    redirect_to user_path
  end

private

    def answer_params
      params.require(:answer).permit(:date, :num, :text, :bool, :question_id, :user_id)
    end
    
end
