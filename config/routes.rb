Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :comments

  post '/login', to: 'sessions#create'
end
