Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  root to: "foods#index"

  resources :users do
    resources :foods
  end
end
