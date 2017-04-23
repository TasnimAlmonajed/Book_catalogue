Rails.application.routes.draw do
  devise_for :users, skip: [:passwords]
  root to: 'books#index'
  resources :authors
  resources :books

end
