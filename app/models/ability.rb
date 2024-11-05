# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.persisted? # If the user is logged in
      can :edit, User, id: user.id # Allow user to edit their own profile
      can :update, User, id: user.id # Allow user to update their own profile
      can :create, Course, user_id: user.id
      can :manage, Course, user_id: user.id
      can :manage, Lesson, course: { user_id: user.id }
    else # guest user
      can :read, Course # only read courses
      can :create, User
    end

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