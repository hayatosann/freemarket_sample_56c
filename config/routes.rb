Rails.application.routes.draw do
  get '/users/mypage', to: 'users#mypage'
  get '/users/sign_out', to: 'users#sign_out'
  get '/users/credit_confirmation', to: 'users#credit_confirmation'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'  
  }
  root to: 'products#index'

  get '/users/mypage' => 'users#mypage'
  get '/users/sign_out' => 'users#sign_out'
  get '/users/sms_confirmation' => 'users#sms_confirmation'
  get '/users/address' => 'users#address'
  get '/users/payment' => 'users#payment'
  get '/users/complete' => 'users#complete'
  get '/users/infomation' => 'users#infomation'
  get '/users/mypage/identification' => 'users#identification'

  resources :purchase, only: :show

  resources :products do
    collection{ get "search" }
  end
  resources :users

end

