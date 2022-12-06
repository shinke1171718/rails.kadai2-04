Rails.application.routes.draw do
  get 'reservations/create'
  devise_for :users
  devise_scope :user do
    root "users/sessions#new"
  end

  resources :users, only: [:show]
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
