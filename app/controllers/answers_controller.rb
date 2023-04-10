class AnswersController < ApplicationController
  before_action :load_answer, only: %i[show edit update destroy]

  def show
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end
end
