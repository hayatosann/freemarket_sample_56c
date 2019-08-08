Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'  
  }
  root to: 'products#index'
  resources :products
  resources :users
  resources :purchase, only: :show
  get '/users/mypage' => 'users#mypage'
  get '/users/sign_out' => 'users#sign_out'
end
