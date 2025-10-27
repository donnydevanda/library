Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :books do
    collection do
      get :active
    end
  end
  resources :borrowers do
    collection do
      get :active
    end
  end
  resources :loans do
    collection do
      get :ontime
      get :late
    end
    member do
      put :return
    end
  end
end
