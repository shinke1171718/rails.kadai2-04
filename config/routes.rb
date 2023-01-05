Rails.application.routes.draw do
  resources :rooms
  get 'rooms/listing'
  get 'rooms/pricing'
  get 'rooms/description'
  get 'rooms/photo_upload'
  get 'rooms/amenities'
  get 'rooms/location'
  get 'reservations/create'
  devise_for :users
  devise_scope :user do
    root "users/sessions#new"
  end

  resources :photos

  resources :users, only: [:show]
  resources :reservations

  post '/users/edit', to: 'users#update'
  
  resources :rooms, except: [:edit] do
    member do
      get 'show'
      get 'create'
      get 'new'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
