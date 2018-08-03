Rails.application.routes.draw do
  root 'dashboards#index'

  resources :stations
end
