Rails.application.routes.draw do

  get 'static_pages/home'

  root to: 'static_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy]
  end

  resources :categories, only: [:index, :show]

  resources :gifs, only: [:put] do
    put :favorite, on: :member
  end
end
