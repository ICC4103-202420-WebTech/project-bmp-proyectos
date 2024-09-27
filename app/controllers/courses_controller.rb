# app/controllers/courses_controller.rb
class CoursesController < ApplicationController
  def index
    if current_user.instructor?
      # Show courses published by the instructor
      @courses = current_user.courses
    else
      # Show courses the student is enrolled in
      @courses = current_user.enrolled_courses
    end
  end

  def show
    @course = Course.find(params[:id])
    @lections = @course.lections
    @inscription = current_user.inscriptions.find_by(course_id: @course.id)
  end
end
