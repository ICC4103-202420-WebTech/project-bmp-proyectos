class ForumsController < ApplicationController
  before_action :set_course_and_lesson, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_forum, only: [:show, :show_question] # Ensure this is included
  before_action :set_question, only: [:show_question] # Only set question for the show_question action

  def index
    @forums = @lesson.forums
  end

  def show
    @questions = @forum.questions
  end

  def show_question
    @answers = @question.answers

  end

  def new
    @forum = @lesson.forums.new
  end

  def create
    @forum = @lesson.forums.new(forum_params)
    if @forum.save
      redirect_to course_lesson_forum_path(@course, @lesson, @forum), notice: 'Forum was successfully created.'
    else
      render :new
    end
  end

  def edit
    @forum = @lesson.forums.find(params[:id])
  end

  def update
    @forum = @lesson.forums.find(params[:id])
    if @forum.update(forum_params)
      redirect_to course_lesson_forum_path(@course, @lesson, @forum), notice: 'Forum was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @forum = @lesson.forums.find(params[:id])
    @forum.destroy
    redirect_to course_lesson_forums_path(@course, @lesson), notice: 'Forum was successfully deleted.'
  end

  private

  def forum_params
    params.require(:forum).permit(:title, :description) # Adjust the permitted parameters as needed
  end
  
  def set_course_and_lesson
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:lesson_id])
  end

  def set_forum
    @forum = Forum.find(params[:id]) # This assumes the forum_id is passed in the URL
  end

  def set_question
    @question = @forum.questions.find(params[:id]) # Assuming the question ID is passed as :id
  end
end