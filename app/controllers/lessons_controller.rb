class LessonsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :course
  load_and_authorize_resource :lesson, through: :course
  before_action :set_course, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  def index
    if params[:course_id]
      @course = Course.find(params[:course_id])
      @lessons = @course.lessons
    else
      @lessons = Lesson.all # or handle it in another way
    end
  end

  def show
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.build
  end

  def create
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to course_lessons_path(@course), notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to course_lessons_path(@lesson.course), notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to course_lessons_path(@lesson.course), notice: 'Lesson was successfully destroyed.'
  end

  private
  def set_course
    @course = Course.find_by(id: params[:course_id])
    unless @course
      redirect_to courses_path, alert: 'Course not found.'
    end
  end
  def lesson_params
    params.require(:lesson).permit(:title, :content, :content_type)
  end
end
