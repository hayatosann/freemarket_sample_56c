Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',  
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'products#index'

  get '/users/mypage', to: 'users#mypage'
  get '/users/sign_out', to: 'users#sign_out'

  get '/users/information', to: 'users#information'
  get '/users/sms_confirmation', to: 'users#sms_confirmation'
  post '/users/sms_confirmation', to: 'users#sms_confirmation'
  get '/users/address', to: 'users#address'
  post '/users/address', to: 'users#address'
  get '/users/payment', to: 'users#payment'
  post '/users/payment', to: 'users#payment'
  get '/users/complete', to: 'users#complete'
  post '/users/complete', to: 'users#complete'

  get '/users/mypage/identification', to: 'users#identification'
  get '/users/:id/credit_confirmation', to: 'users#credit_confirmation'
  post '/users/:id/credit_confirmation', to: 'users#credit_confirmation'
  get '/users/:id', to: "profile#edit"
  patch '/users/:id', to: "profile#create"


  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get "search"
    end
    resources :purchase, only: [:new, :create] 
  end

  resources :users, except: :show
end

