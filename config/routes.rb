Rails.application.routes.draw do
  get '/users/mypage', to: 'users#mypage'
  get '/users/sign_out', to: 'users#sign_out'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'  
  }
  root to: 'products#index'
  resources :purchase, only: :show

  resources :products
  resources :users
end
