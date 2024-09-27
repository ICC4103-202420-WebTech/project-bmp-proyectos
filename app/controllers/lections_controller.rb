class LectionsController < ApplicationController
    def show
      @lection = Lection.find(params[:id])
      @forum = @lection.forum
      @questions = @forum.questions if @forum.present?
    end
  end
  