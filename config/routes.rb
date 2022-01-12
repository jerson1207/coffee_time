Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  root 'static_page#home'
  resources :menus
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
