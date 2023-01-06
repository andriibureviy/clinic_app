Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors
  devise_for :users

  resources :categories
  resources :appointments
  resources :users do
    member do
      get :profile
      get :view_doctors
      get :make_appointment
      get :view_recommendation
    end
  end
  resources :doctors, only: [:show] do
    member do
      get :appointments
    end
  end

  patch "doctors/:id", to: "doctors#update"
  get '/doctors', to: 'doctors#index'
  get '/doctors/:doctor_id/appointments/:id', to: 'appointments#show', as: :doctor_appointment
  patch '/doctors/:doctor_id/appointments/:id', to: 'appointments#update', as: :doctor_appointment_update
  get '/categories/:id/doctors', to: 'categories#doctors', as: :category_doctors

  get "/home", to: "application#home"

  root to: "application#home"
end
