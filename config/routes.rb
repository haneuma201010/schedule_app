Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  
  get    '/admin_login',   to: 'admin_sessions#new'
  post   '/admin_login',   to: 'admin_sessions#create'
  delete '/admin_logout',  to: 'admin_sessions#destroy'
  
  get    '/school_login',   to: 'school_sessions#new'
  post   '/school_login',   to: 'school_sessions#create'
  delete '/school_logout',  to: 'school_sessions#destroy'
  
  resources :admin_users
  resources :school_users
  
  
  end
