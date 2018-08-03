Rails.application.routes.draw do
  root 'dashboards#index'

  resources :stations
  resources :users
  resources :trains
  delete '/logout', to: 'users#logout'
end
