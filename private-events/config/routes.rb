Rails.application.routes.draw do
  





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"

  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :events

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", as:"sign_in"
    get '/sign-up' => "devise/registrations#new", as:"sign_up"
  end

  get '/users', to:"users#index", as:"community"
  get '/user/:id', to:'users#show', as:'user'

  resources :event_attendees, only:[:create, :destroy]


end
