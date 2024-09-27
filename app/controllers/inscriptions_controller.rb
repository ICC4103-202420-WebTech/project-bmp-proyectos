class InscriptionsController < ApplicationController
    def create
      @course = Course.find(params[:course_id])
      @inscription = @course.inscriptions.create(user: current_user, progress: 0)
      redirect_to @course
    end
  
    def update
      @inscription = Inscription.find(params[:id])
      if @inscription.update(inscription_params)
        redirect_to course_path(@inscription.course), notice: 'Progress updated.'
      else
        render :edit
      end
    end
  
    private
  
    def inscription_params
      params.require(:inscription).permit(:progress)
    end
  end
  