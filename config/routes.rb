Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, except: [:index] do
    resources :books
  end
  resources :sessions, only: [:new, :create]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

end
