class AnswersController < ApplicationController

  before_action :set_question

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user # Assuming you have a method to get the current user

    if @answer.save
      redirect_to course_lesson_forum_question_path(@course, @lesson, @forum, @question), notice: 'Answer was successfully created.'
    else
      redirect_to course_lesson_forum_question_path(@course, @lesson, @forum, @question), alert: 'Error creating answer.'
    end
  end
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer deleted successfully"
    redirect_to courses_path
  end
  private
  def set_question
    @question = Question.find(params[:question_id]) # Find the question by ID
  end

  def answer_params
    params.require(:answer).permit(:content) # Permit the content attribute
  end
end
