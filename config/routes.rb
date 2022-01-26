Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users, only: [:index]
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
  end

  resources :users, except: [:index, :show]
  get '/profile/:id', to: 'users#show', as: "profile"
  
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

    
      # root 'admin/dashboard#index'
 
      root 'static_page#home'
  
  

  get 'sessions/new'
  get '/signup', to: 'users#new'

  get '/profile/:id/edit', to: 'users#edit', as: "edit"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'my_purchases', to: 'my_purchases#index'
end
