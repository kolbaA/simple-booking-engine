Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'locations#index'

  resources :locations, only: %i[index show] do
    get :available_rooms, on: :member
  end

  resources :bookings, only: %i[create] do
    get :confirmation, on: :member
  end

  get :booking_error, controller: :bookings
end
