Rails.application.routes.draw do

#I managed to insert many routes to allow users to access to each content of the website

  get 'adminreview/show'

  get 'adminreview/new'

  get 'adminreview/edit'

  get 'adminreview/destroy'

  get 'adminreview/create'

  get 'adminreview/index'

  get 'admingames/show'

  get 'admingames/new'

  get 'admingames/edit'

  get 'buy_games/index'

  get 'buy_games/show'

  #Here I used the father and child inheritence
  resources :films do
  	resources :reviews
  end


  resources :rentals
  resources :buy_films
  resources :admin
  resources :adminrentals
  resources :adminfilms
  resources :logins
  resources :admins_login
  resources :games
  resources :adminuser
  resources :admingames
  resources :buy_games


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

  get '/cool' => 'logins#index'  

  
  #This is the default web page route
  root :to => "films#index"

end
