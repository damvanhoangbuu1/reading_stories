Rails.application.routes.draw do
  get "/hot", to: "stories#hot"

  root "static_page#home"
  resources :stories
end
