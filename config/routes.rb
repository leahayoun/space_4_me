Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/create'
  get 'tasks/update'
  get 'tasks/destroy'
  devise_for :users

  root to: "pages#home"
  get "home", to: "pages#home"
  get "dashboard", to: "appointments#dashboard", as: :dashboard # appointments en tant que home when users are connected

  # page de profil de l'utilisateur connecté
  get "profile", to: "users#profile", as: :profile

  # page des paramètres
  get "settings", to: "users#settings", as: :settings
  post "settings/update_locale", to: "users#update_locale", as: :update_locale
  get "settings/export_data", to: "users#export_data", as: :export_data

  resources :onboarding, only: [:show, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"

    resources :hormonal_treatments, only: [:new, :create]
    resources :operations, only: [:new, :create]

    resources :appointments do
      collection do
        get 'day_details' # GET /appointments/jour_detail?date=2024-01-15
      end
    end

    resources :diaries

    # resources :feelings, only: [:create, :show] do
    #   resources :user_moods
    #   resources :user_symptoms
    # end

    resources :feelings, only: [:new, :create, :show]

    resources :tasks, only: [:index, :create, :update, :destroy]
    # update pour les checkbox


    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check
end
