class AnswersController < ApplicationController
    def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.create(answer_params.merge(user: current_user))
      redirect_to lection_path(@question.forum.lection)
    end
  
    private
  
    def answer_params
      params.require(:answer).permit(:content)
    end
  end
  