Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors
  devise_for :users
  resources :categories
  resources :doctors
  resources :users
end
