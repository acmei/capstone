class QuestionsController < ApplicationController
  def destroy
    urge = Question.find_by(id: params[:question_id])
    answers = Answer.where(question_id: urge.id)
    answers.destroy_all
    urge.destroy

    redirect_to settings_path, notice: "The question has been deleted from your diary"
  end
end
