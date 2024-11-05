class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :instructor_only, except: [:index, :show]
  load_and_authorize_resource class: 'Course'
  def index
    @latest_courses = @courses.order(created_at: :desc).limit(10)
    
    # Apply CanCanCan's accessibility check
    @latest_courses = @latest_courses.accessible_by(current_ability)
    
    Rails.logger.debug "Latest Courses: #{@latest_courses.inspect}"
  end

  def show
    @course = Course.find(params[:id])
    @lections = @course.lessons
    @inscription = current_user.inscriptions.find_by(course_id: @course.id)
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)  # Assuming current_user is the instructor
    if @course.save
      flash[:notice] = "Course created successfully"
      redirect_to @course
    else
      flash[:alert] = "Failed to create course"
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "Course updated successfully"
      redirect_to @course
    else
      flash[:alert] = "Failed to update course"
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course deleted successfully"
    redirect_to courses_path
  end
  private

  def course_params
    params.require(:course).permit(:title, :description)
  end

  def instructor_only
    redirect_to courses_path, alert: "Not authorized" unless current_user.role == 'instructor'
  end
end
