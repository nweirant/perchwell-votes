Rails.application.routes.draw do
  resources :clients, only: [:index]
  resources :votes, only: [:show]

  post "/votes/:id", to: "votes#create"
end
