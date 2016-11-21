Rails.application.routes.draw do
  resources :films do
  	resources :reviews
  end


  resources :rentals
    resources :buys
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/cool' => 'login#index'  

end
