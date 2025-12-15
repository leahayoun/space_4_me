Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "home", to: "pages#home"
  get "dashboard", to: "appointments#dashboard", as: :dashboard # appointments en tant que home when users are connected

  # page de profil de l'utilisateur connecté
  get "profile", to: "users#profile", as: :profile

  resources :onboarding, only: [:show, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"

    resources :hormonal_treatments, only: [:new, :create]
    resources :operations, only: [:new, :create]

    resources :appointments

    resources :diaries

    # resources :feelings, only: [:create, :show] do
    #   resources :user_moods
    #   resources :user_symptoms
    # end

    resources :feelings, only: [:new, :create, :show]

    resources :tasks
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check
end
