# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.instructor?
      can :manage, Course, user_id: user.id
      can :manage, Lesson, course: { user_id: user.id }
    end

    if user.student?
      can :read, Course
      can :read, Lesson
    end

    # Allow all users (including guests) to read courses
    can :read, Course
  end
end