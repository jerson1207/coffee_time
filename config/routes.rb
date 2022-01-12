Rails.application.routes.draw do
  resources :users
  root 'static_page#home'
  resources :menus
  get '/signup', to: 'users#new'
  
end
