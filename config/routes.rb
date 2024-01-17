Rails.application.routes.draw do
  resources :posts,  only: [:index, :create]
  resources :users
  resources :comments
end
