Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/login', to: 'home#new'

  get 'sign_up', to: 'user#new'
  post 'sign_up', to: 'user#create'
  post 'login' => 'login#create'
  delete 'logout' => 'login#destroy'

  get 'weather' => 'weather#home'
  get 'weather_data' => 'weather#show'
end
