Rails.application.routes.draw do
  resources :user, only: [:create, :index, :update, :destroy, :show]
  post '/login', to: 'authentication#login'
end
