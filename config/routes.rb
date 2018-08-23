Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'projects#index'
  
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :projects
  resources :tickets do 
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :tags, except: [:show]
  resources :users, only: [:new, :create]

end
