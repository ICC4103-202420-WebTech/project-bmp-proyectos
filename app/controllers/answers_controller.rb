class AnswersController < ApplicationController

  before_action :set_forum_and_question

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to course_lesson_forum_question_path(@course, @lesson, @forum, @question), notice: 'Answer was successfully created.'
    else
      redirect_to course_lesson_forum_question_path(@course, @lesson, @forum, @question), alert: 'Error creating answer.'
    end
  end

  private

  def set_forum_and_question
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:lesson_id])
    @forum = @lesson.forums.find(params[:forum_id])
    @question = @forum.questions.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content) # Adjust as necessary
  end
end