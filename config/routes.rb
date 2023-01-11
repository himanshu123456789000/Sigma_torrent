Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "browses#index"
   get '/signup', to: 'admins#new'
    
  resources :admins
  resources :browses
    
    # get '/details' => 'admins#show', :defaults => { :id =>  'name'}

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
end
