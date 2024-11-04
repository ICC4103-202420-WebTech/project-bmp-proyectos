class InscriptionsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @inscription = @course.inscriptions.create(user: current_user, progress: 0)
    redirect_to @course
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course deleted successfully"
    redirect_to courses_path
  end
  private
  
  def inscription_params
    params.require(:inscription).permit(:progress)
  end
end
