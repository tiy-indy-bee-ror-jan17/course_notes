Rails.application.routes.draw do

  root 'visitors#index'

  get '/visitors/:id' => 'visitors#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
