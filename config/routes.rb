Rails.application.routes.draw do
  resources :user, only: [:create, :index, :update, :destroy, :show]
end
