Rails.application.routes.draw do
  resources :user, only: [:create, :index, :update, :destroy, :show]
  resources :meeting_room, only: [:create, :index, :destroy, :show]
  post '/login', to: 'authentication#login'
end
