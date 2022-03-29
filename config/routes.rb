Rails.application.routes.draw do
  devise_for :users
  root to: 'materials#index'
  resources :materials
  resources :purchases
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
