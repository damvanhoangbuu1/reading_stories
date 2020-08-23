Rails.application.routes.draw do
  get '/signup', to: "users#new" 
  get "/hot", to: "stories#hot"

  root "static_page#home"
  resources :stories
  resources :categories, only: [:show]
  resources :chapters, only: [:show]
  resources :users
end
