Rails.application.routes.draw do
  root 'jobs#index'
  resources :companies
end
