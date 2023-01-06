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

  get '/doctors/:id/appointments', to: 'doctors#appointments', as: :doctor_appointments
  get '/doctors/:doctor_id', to: 'doctors#show'
  get '/doctors', to: 'doctors#index'
  get '/doctors/:doctor_id/appointments/:id', to: 'appointments#show', as: :doctor_appointment
  patch '/doctors/:doctor_id/appointments/:id', to: 'appointments#update', as: :doctor_appointment_update
  get '/categories/:id/doctors', to: 'categories#doctors', as: :category_doctors

  # patch '/doctors/:doctor_id/appointments/:id', to: 'appointments#update', as: :doctor_appointment_update
  # get '/doctors/:doctor_id/appointments/:id', to: 'doctors#show_appointment', as: :doctor_appointment

  get "/home", to: "application#home"

  root to: "application#home"
end
