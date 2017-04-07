Rails.application.routes.draw do

  root to: 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    # resources :favorites, only: [:index]
  end

  namespace :admin do
    # root to: 'admin/categories#index'
    resources :categories
  end

end
