Rails.application.routes.draw do
  resources :menus do
    resources :orders, only: [:create, :new]
  end

  get 'sessions/new'
  resources :users, except: [:show, :edit]
  root 'static_page#home'
  get '/signup', to: 'users#new'
  get '/profile/:id', to: 'users#show', as: "profile"
  get '/profile/:id/edit', to: 'users#edit', as: "edit"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
