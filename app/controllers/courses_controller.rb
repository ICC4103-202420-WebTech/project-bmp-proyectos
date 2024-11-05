class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :instructor_only, except: [:index, :show]
  load_and_authorize_resource class: 'Course'
  def index
    @latest_courses = @courses.order(created_at: :desc).limit(10)
  
    # Apply CanCanCan's accessibility check
    @latest_courses = @latest_courses.accessible_by(current_ability)
    
    # Fetch inscriptions for the current user, indexed by course_id
    @inscriptions = Inscription.where(user: current_user).index_by(&:course_id)
  
    Rails.logger.debug "Latest Courses: #{@latest_courses.inspect}"
    Rails.logger.debug "User  Inscriptions: #{@inscriptions.inspect}"
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
  def complete_course
    @course = Course.find(params[:id])
    inscription = Inscription.find_or_initialize_by(user: current_user, course: @course)
    
    # Assuming progress is a percentage, for example, 100 for complete
    inscription.update_progress(100) # Set to 100% when completed

    redirect_to courses_path, notice: 'Course completed successfully!'
  end
end
