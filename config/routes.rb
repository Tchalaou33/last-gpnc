Rails.application.routes.draw do

  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/signed_in'
  resources :movies
  resources :users, only: [:create, :show, :index] do
    resources :items, only: [:create, :show, :index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
