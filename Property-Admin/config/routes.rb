Rails.application.routes.draw do
  #resources :properties
  #get 'public/main'
  #devise_for :accounts
  #root 'pins#index'
  #resources :pins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
    ##get 'dashboard/index'
  get "/dashboard" => 'dashboard#index', as: :dashboard
  # get 'dashboard/properties'
  # get 'dashboard/reports'
  resources :properties
  devise_for :accounts
  ##get 'public/main'
  root to: 'public#main'
  #root 'pins#index'
  resources :pins
end
