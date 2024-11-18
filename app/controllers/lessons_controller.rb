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
    Rails.logger.debug("Current user: #{current_user.inspect}")
    Rails.logger.debug("User  enrolled in courses: #{current_user.enrolled_courses.pluck(:id)}")
  
    if params[:course_id]
      @course = Course.find(params[:course_id])
      Rails.logger.debug("Course found: #{@course.inspect}")
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
    @course = Course.find(params[:course_id]) # Assuming you have a course_id in your params
    @lesson = @course.lessons.build(lesson_params) # Build the lesson associated with the course
    @lesson.user = current_user # Set the user to the currently authenticated user
  
    if @lesson.save
      redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
  
    if @lesson.update(lesson_params)
      redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
    @lesson.destroy
    redirect_to course_lessons_path(@course), notice: 'Lesson was successfully destroyed.'
  end

  private
  def set_course
    @course = Course.find_by(id: params[:course_id])
    unless @course
      redirect_to courses_path, alert: 'Course not found.'
    end
  end
  def lesson_params
    params.require(:lesson).permit(:title, :content_type, :content) 
   end
end
