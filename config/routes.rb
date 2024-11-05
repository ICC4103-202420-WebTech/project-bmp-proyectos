Rails.application.routes.draw do
  get 'answers/create'
  get 'answers/destroy'
  get 'questions/create'
  get 'questions/destroy'
  get 'forums/show'
  get 'inscriptions/create'
  get 'inscriptions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'lessons/index'
  get 'lessons/show'
  get 'lessons/new'
  get 'lessons/create'
  get 'lessons/edit'
  get 'lessons/update'
  get 'lessons/destroy'
  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/create'
  get 'courses/edit'
  get 'courses/update'
  get 'courses/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
get 'profile', to: 'users#show', as: 'user_profile'
  # Defines the root path route ("/")
  root to: 'courses#index'

  resources :courses do
    resources :lessons, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  resources :users, only: [:show, :index]
  resources :lessons
  resources :inscriptions
  resources :forums
  resources :questions
  resources :answers
end
