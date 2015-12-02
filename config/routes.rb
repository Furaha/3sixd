Rails.application.routes.draw do
  devise_scope :user do
    get "/users/sign_up",  :to => "jobs#index"
  end
  devise_for :users
  root 'jobs#index'

  authenticate :user do
    scope "/admin" do
      resources :companies
    end
  end
end
