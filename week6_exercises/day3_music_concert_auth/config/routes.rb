Rails.application.routes.draw do

  get '/'       => 'sites#index'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#delete'
  get '/signup' => 'users#create'



  resources :users, only: [:index, :new, :show, :create]


  resources :concerts, only: [:new, :create, :show, :destroy, :index] do 
  	resources :comments, only: [:new, :create]
  end
end
