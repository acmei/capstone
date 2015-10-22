class DiariesController < ApplicationController
  before_action :require_login
  before_action :define_user
  before_action :find_diary, only: [:edit, :update, :destroy]

  # Display diary(s)
  def show; end

  # Add a new diary
  def new
    @diary = Diary.new
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

  # Delete a question
  def rm_question
    @diary = Diary.find(params[:diary])
    @question = Question.find(params[:question])
    ids = @question.diary_ids.delete_if { |id| id == @diary.id }
    @question.diary_ids = ids

    redirect_to user_path(session[:user_id], :diary => @diary.id)
  end

private

    def find_diary
      @diary = Diary.find(params[:id])
    end

    def diary_params
      params.require(:diary).permit(:filled_in_session, :times_filled, :user_id)
    end

end
