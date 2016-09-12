Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/new', to: 'users#new', as: :new_user
  post '/users', to: 'users#create'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update, :index]
    end
  end

  resources :links, only: [:index, :update, :create, :edit]
end
