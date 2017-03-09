Rails.application.routes.draw do

  root 'chirps#index'

  resources :chirps
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
