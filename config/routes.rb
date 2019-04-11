Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "uploads#index"
  resources :item_photos
  resources :items
  resources :uploads
end
