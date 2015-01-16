WorkRails1::Application.routes.draw do


  post 'validation_ajax' => 'users#validation_ajax'
  post 'validation_aj' => 'users#validation_ajax'
  ##resources :users
  ##resources :sessions

  namespace :public do

  get "sessions/new"

  root :to => "users#index"

  post 'users/validation_ajax'
  post 'users/validation_aj' => 'users#validation_ajax'
  post 'users/:id/validation_aj' => 'users#validation_ajax'
  

  resources :users
  resources :sessions
  end
  
end
