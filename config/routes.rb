Rails.application.routes.draw do
  devise_for :users
  root 'jobs#index'

  authenticate :user do
    scope "/admin" do
      resources :companies
    end
  end
end
