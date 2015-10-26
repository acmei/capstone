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
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to user_path(@user)
    else
      render new_diary_path
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
