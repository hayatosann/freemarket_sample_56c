Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'  
  }
  resources :products
  root to: 'products#index'
  get '/users/mypage' => 'users#mypage'
  get '/users/sign_out' => 'users#sign_out'
  resources :users
  
end
