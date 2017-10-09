Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#index"
  resources :static_pages

  get '/registration', to:"users#new", as:"registration"
  post '/registration', to:'users#create'

  resources :users, only:[:index, :new, :create]

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'


  get 'posts/index', to:'posts#index', as:"posts"
  get 'posts/new', to:'posts#new', as:"new_post"
  post '/post', to:'posts#create'

end
