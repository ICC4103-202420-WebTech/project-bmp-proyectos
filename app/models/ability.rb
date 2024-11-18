# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Allow all users (including guests) to read courses and lessons
    can :read, Course
    can :read, Lesson

    if user.persisted? # If the user is logged in
      can :read, User, id: user.id
      can :edit, User, id: user.id # Allow user to edit their own profile
      can :update, User, id: user.id # Allow user to update their own profile
      can :create, Course, user_id: user.id
      can :manage, Course, user_id: user.id
      can :manage, Lesson, course: { user_id: user.id }

      if user.instructor?
        can :create, Lesson, user_id: user.id # Allow instructors to create lessons
        can :manage, Lesson, course: { user_id: user.id } # Instructors can manage their own lessons
      end

      if user.student?
        can :read, Course do |course|
          course.students.include?(user) # Allow access to courses the student is enrolled in
        end

        can :read, Lesson do |lesson|
          lesson.course.students.include?(user) # Allow access to lessons in courses the student is enrolled in
        end
      end
    end

    # Allow all users (including guests) to create responses to questions
    can :create, Answer # Assuming Response is the model for forum responses
  end
end