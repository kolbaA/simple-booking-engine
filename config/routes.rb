Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Api::Base => '/api'

  root 'locations#index'

  resources :locations, only: %i[index show] do
    resources :rooms, only: %i[index]
  end

  resources :bookings, only: %i[create] do
    get :confirmation, on: :member
  end

  get :booking_error, controller: :bookings
end
