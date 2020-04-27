Rails.application.routes.draw do
  namespace :admin do
    resources :bookings
    resources :items

    root to: "items#index"
  end

  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resources :bookings, shallow: true
  end
end
