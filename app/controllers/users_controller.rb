class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @enrolled_courses = @user.enrolled_courses
    end
  end
  