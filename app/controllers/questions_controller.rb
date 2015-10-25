class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Diary question successfully added."
      redirect_to settings_path
    else
      render settings_path
    end
  end

  def destroy
    urge = Question.find_by(id: params[:question_id])
    answers = Answer.where(question_id: urge.id)
    answers.destroy_all
    urge.destroy

    redirect_to settings_path, notice: "The question has been deleted from your diary"
  end

  private

    def question_params
      params.require(:question).permit(:text, :category, :answer_type, :recurrence)
    end
    
end
