class LessonsController < ApplicationController
  before_action :set_course
  def index
    @course = Course.find(params[:course_id])
    @lessons = @course.lessons
  end

  def show
    @lesson = Lesson.find(params[:id])
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

  def lesson_params
    params.require(:lesson).permit(:title, :content, :content_type)
  end
end
