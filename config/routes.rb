Rails.application.routes.draw do
  root 'static_page#home'
  resources :menus
  
end
