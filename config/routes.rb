Rails.application.routes.draw do
  resources :menus do
    resources :orders, only: [:create, :new] do
      member do
        get '/cancel', to: 'orders#cancel'
        get '/preparing', to: 'orders#preparing'
        get '/shipping', to: 'orders#shipping'
        get '/complete', to: 'orders#complete'
      end
    end
  end
  resources :users, except: [:show, :edit]

  get 'dashboard', to: 'dashboard#index'

  get 'sessions/new'
  root 'static_page#home'
  get '/signup', to: 'users#new'
  get '/profile/:id', to: 'users#show', as: "profile"
  get '/profile/:id/edit', to: 'users#edit', as: "edit"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
