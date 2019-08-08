Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'  
  }
  resources :products
  root to: 'products#index'
  get '/users/mypage' => 'users#mypage'
  get '/users/sign_out' => 'users#sign_out'
  get '/users/sms_confirmation' => 'users#sms_confirmation'
  get '/users/address' => 'users#address'
  get '/users/payment' => 'users#payment'
  get '/users/complete' => 'users#complete'
  get '/users/infomation' => 'users#infomation'
end

