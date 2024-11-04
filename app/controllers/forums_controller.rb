class ForumsController < ApplicationController
  def show
    @forum = Forum.find(params[:id])
    @questions = @forum.questions
  end
end
