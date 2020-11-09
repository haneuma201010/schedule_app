Rails.application.routes.draw do
  
  get 'student_sessions/new'
  get 'student_users/new'
  root to: 'static_pages#home'
  
  get    '/admin_login',   to: 'admin_sessions#new'
  post   '/admin_login',   to: 'admin_sessions#create'
  delete '/admin_logout',  to: 'admin_sessions#destroy'
  
  get    '/school_login',   to: 'school_sessions#new'
  post   '/school_login',   to: 'school_sessions#create'
  delete '/school_logout',  to: 'school_sessions#destroy'
  
  get    '/login',   to: 'student_sessions#new'
  post   '/login',   to: 'student_sessions#create'
  delete '/logout',  to: 'student_sessions#destroy'
  
  resources :admin_users
  resources :school_users
  resources :student_users
  
  
  end
