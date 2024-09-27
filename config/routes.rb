# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

  # Define root path to show login form
  devise_scope :user do
    root to: 'devise/sessions#new' # Root path leads to login page
  end

  # Custom paths for instructors and students
  get 'instructor/courses', to: 'courses#index', as: 'instructor_courses'
  get 'student/courses', to: 'courses#index', as: 'student_courses'

  # Standard routes
  resources :courses, only: [:index, :show] do
    resources :lections, only: [:show] do
      resources :forums, only: [:show] do
        resources :questions, only: [:create]
      end
    end
    resources :inscriptions, only: [:create, :update]
  end
end
