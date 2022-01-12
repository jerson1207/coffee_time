Rails.application.routes.draw do

  resources :menus
  get 'sessions/new'
  resources :users
  root 'static_page#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
