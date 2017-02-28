Rails.application.routes.draw do
  root 'lipsums#index'
  get "/lipsums" => 'lipsums#index'
  post '/lipsums' => 'lipsums#create'
  put '/lipsums/:id' => 'lipsums#update'
  patch '/lipsums/:id' => 'lipsums#update'
  get '/lipsums/:id' => 'lipsums#show'
  delete '/lipsums/:id' => 'lipsums#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
