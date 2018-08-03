Rails.application.routes.draw do
  root 'dashboards#index'

  resources :stations
  resources :users
  resources :tickets
  resources :trains do
    resources :tickets
  end
  delete '/logout', to: 'users#logout'
end
