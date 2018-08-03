Rails.application.routes.draw do
  root 'dashboards#index'

  resources :stations
  resources :users
end
