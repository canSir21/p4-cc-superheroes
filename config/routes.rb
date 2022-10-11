Rails.application.routes.draw do
  resources :heroes, only: [:index, :show, :create]
  resources :powers, only: [:index, :show, :create, :update]
  resources :hero_powers, only: [:create]
end
