class QuestionsController < ApplicationController
  before_action :set_course_and_lesson_and_forum
  before_action :set_question, only: [:show]
  before_action :authenticate_user!

  def index
    @questions = @forum.questions
  end

  def show
    @question = @forum.questions.find(params[:id])
  end


  def new
    @question = @forum.questions.new
  end

  def create
    @question = @forum.questions.new(question_params)
    if @question.save
      redirect_to course_lesson_forum_question_path(@course, @lesson, @forum, @question), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
    @question = @forum.questions.find(params[:id])
  end

  def update
    @question = @forum.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to course_lesson_forum_question_path(@course, @lesson, @forum, @question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @question = @forum.questions.find(params[:id])
    @question.destroy
    redirect_to course_lesson_forum_questions_path(@course, @lesson, @forum), notice: 'Question was successfully deleted.'
  end
  
    private
    def set_course_and_lesson_and_forum
      @course = Course.find(params[:course_id])
      @lesson = @course.lessons.find(params[:lesson_id])
      @forum = @lesson.forums.find(params[:forum_id])
    end
    
    def question_params
      params.require(:question).permit(:content)
    end
    def set_question
      @question = @forum.questions.find(params[:id])
    end
end
