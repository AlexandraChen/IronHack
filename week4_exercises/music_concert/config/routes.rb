Rails.application.routes.draw do

  get "/" => "sites#index"

  resources :concerts, only: [:new, :create, :show, :destroy, :index] do 
  	resources :comments, only: [:new, :create]
  end
end
