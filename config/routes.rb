Rails.application.routes.draw do
  devise_for :users
  resources :products
  get '/users/sign_out' => 'users#sign_out'
end
