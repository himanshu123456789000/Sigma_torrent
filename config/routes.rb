Rails.application.routes.draw do

  get 'welcome/index'
  root "welcome#index"
  get '/signup', to: 'admins#new'
    
  resources :admins
  resources :browses
  resources :comments


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  
end
