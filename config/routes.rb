Rails.application.routes.draw do
  root 'dashboards#index'

  resources :stations
  resources :users
  delete '/logout', to: 'users#logout'
end
