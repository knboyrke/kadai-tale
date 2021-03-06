Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]do
    member do
      get :followings
      get :followers
      get :likes
    end
  end


  get 'tales/rank', to: 'tales#rank'
  get 'tales/search', to: 'tales#search'
  post 'tales/search', to: 'tales#search'
  
  resources :tales
  
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end