Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get 'create', to: 'tweet#new'
  post 'create', to: 'tweet#create'
  get 'like', to: 'tweet#like'
  get 'unlike', to: 'tweet#unlike'
  get 'view', to: 'tweet#view'
  get 'retweet', to: 'tweet#retweet'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'
  get 'welcome', to: 'sessions#welcome'
end