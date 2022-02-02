Rails.application.routes.draw do
  root 'static_page#home'
  resources :contact_us, only: :index
  resources :users, except: [:index, :show, :edit]
  get '/profile/:id', to: 'users#show', as: "profile"
  get '/profile/:id/edit', to: 'users#edit', as: "edit"
  resources :menus, only: :show do
    resources :orders, only: [:create, :new] do
      member do
        get '/cancel', to: 'orders#cancel'
        get '/preparing', to: 'orders#preparing'
        get '/shipping', to: 'orders#shipping'
        get '/complete', to: 'orders#complete'
      end
    end
  end
  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'my_purchases', to: 'my_purchases#index'

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users, only: [:index, :show]
    get '/profile/:id', to: 'users#show', as: "profile"
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
    resources :contact_us, only: :index
  end
end
