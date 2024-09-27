class QuestionsController < ApplicationController
    def create
      @forum = Forum.find(params[:forum_id])
      @question = @forum.questions.create(question_params.merge(user: current_user))
      redirect_to lection_path(@forum.lection)
    end
  
    private
  
    def question_params
      params.require(:question).permit(:content)
    end
  end
  