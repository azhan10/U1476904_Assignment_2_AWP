Rails.application.routes.draw do
  resources :films do
  	resources :reviews
  end


  resources :rentals
  resources :buys
  resources :admin
  resources :adminrentals

  get '/adminCool' => 'admins_login#index'  

  get '/adminlogin' => 'admins_sessions#new'
  post '/adminlogin' => 'admins_sessions#create'  
  get '/adminlogout' => 'admins_sessions#destroy'

  get '/adminsignup' => 'admins#new'
  post '/admins' => 'admins#create'

  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/cool' => 'login#index'  

  

end
