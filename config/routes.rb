Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"

  resources :users do
    resources :foods
    resources :exercises
  end
end
