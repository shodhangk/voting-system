Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :elections, only: [:create, :index]
    resources :candidates, only: [:create, :index]
    resources :voter, only: [:create, :index, :show]
  end

  post 'login', to: 'session#create'
  post 'signup', to: 'session#register'

  resources :votes, only: [:create]
  resources :elections, only: [:index, :show]

  get 'election/results', to: 'elections#result'
end
