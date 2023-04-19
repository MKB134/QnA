class AnswersController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :load_answer, only: %i[show edit update destroy]

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params.merge(user_id: current_user.id))

    if @answer.save
      redirect_to @answer.question, notice: 'Your answer added'
    else
      render 'questions/show'
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    unless current_user.author_of?(@answer)
      return @answer.question, notice: 'Delete unavailable! You are not author of the answer'
    end

    @answer.destroy
    redirect_to @answer.question, notice: 'Answer was successfully deleted.'
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
