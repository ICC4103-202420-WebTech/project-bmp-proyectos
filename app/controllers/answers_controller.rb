class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params.merge(user: current_user))
    redirect_to lesson_path(@question.forum.lection)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer deleted successfully"
    redirect_to courses_path
  end
  private
  
  def answer_params
    params.require(:answer).permit(:content)
  end
end
