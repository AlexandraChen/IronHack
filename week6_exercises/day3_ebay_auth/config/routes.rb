Rails.application.routes.draw do

  get "/" => "sites#home"
  get "/products/:id" => "products#show_product"
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#delete'

  resources :users, only: [:new, :create, :show, :destroy, :index] do
    resources :products, only: [:new, :create, :show, :destroy, :index]
  end 
  
  resources :products, only: [:new, :create, :destroy, :index]

  resources :reviews, only: [:create]


end
