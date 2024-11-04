class QuestionsController < ApplicationController
  before_action :set_forum
    def create
      @forum = Forum.find(params[:forum_id])
      @question = @forum.questions.create(question_params.merge(user: current_user))
      redirect_to lesson_path(@forum.lesson)
    end
  
    private
  
    def set_forum
      @forum = Forum.find(params[:forum_id])
    end
    
    def question_params
      params.require(:question).permit(:content)
    end
end
