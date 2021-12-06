Rails.application.routes.draw do
  resources :user, only: [:create, :index, :update, :destroy, :show]
  resources :meeting_room, only: [:create, :index, :destroy, :show, :update]
  post '/login', to: 'authentication#login'
end
