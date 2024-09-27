class ApplicationController < ActionController::Base
    # Redirect to the appropriate page after login
    def after_sign_in_path_for(resource)
      if resource.instructor?
        instructor_courses_path # Redirect to instructor's courses
      else
        student_courses_path # Redirect to student's enrolled courses
      end
    end

    # Redirect to the login page after signing out
    def after_sign_out_path_for(_resource_or_scope)
        new_user_session_path # Redirect to the login page
    end
  end
  
  