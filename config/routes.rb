Rails.application.routes.draw do
  
  root 'static_page#home'
  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, except: [:index, :show, :edit] 
  get '/profile/:id', to: 'users#show', as: "profile"
  get '/profile/:id/addresses/new', to: 'addresses#new', as: "new_address"
  get '/profile/:user_id/addresses/:id/edit', to: 'addresses#edit', as: "edit_address"
  put '/profile/:user_id/addresses/:id/', to: 'addresses#update', as: "update_address"
  delete '/profile/:user_id/addresses/:id/', to: 'addresses#destroy', as: "delete_address"
  resources :addresses, except: [:show, :index]

  get '/profile/:id/edit', to: 'users#edit', as: "edit"
  get '/menus', to: 'menus#index'
  get '/about_us', to: 'static_page#about_us'
  resources :contact_us, only: :index
  get 'my_purchases', to: 'my_purchases#index' 
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
