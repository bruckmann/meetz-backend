Rails.application.routes.draw do
  resources :user, only: [:create, :index, :update, :destroy, :show]
  resources :meeting_room, only: [:create, :index, :destroy, :show, :update]
  resources :appointment, only: [:create, :update, :index, :destroy]
  post '/login', to: 'authentication#login'
  get '/appointment/user_appointments', to: 'appointment#user_appointments'
end
