Rails.application.routes.draw do
  namespace :staff, path: "" do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy ]
    resource :account, except: [ :new, :create, :destroy ]
  end

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy ]
    resources :staff_member do
      resources :staff_events, only: [:index]
    end
    resources :staff_events, only: [:index]
  end

  namespace :customer do
    root "top#index"
  end
end

