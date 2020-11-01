Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  
  get    '/admin_login',   to: 'admin_sessions#new'
  post   '/admin_login',   to: 'admin_sessions#create'
  delete '/admin_logout',  to: 'admin_sessions#destroy'
  
  resources :admin_users
  
  
  
  end
