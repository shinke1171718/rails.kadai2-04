Rails.application.routes.draw do
  resources :photos
  get 'rooms/index'
  get 'rooms/new'
  get 'rooms/create'
  get 'rooms/listing'
  get 'rooms/pricing'
  get 'rooms/description'
  get 'rooms/photo_upload'
  get 'rooms/amenities'
  get 'rooms/location'
  get 'rooms/update'
  get 'reservations/create'
  devise_for :users
  devise_scope :user do
    root "users/sessions#new"
  end

  resources :users, only: [:show]
  resources :reservations

  post '/users/edit', to: 'users#update'
  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
