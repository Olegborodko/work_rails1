WorkRails1::Application.routes.draw do


	post 'validation_ajax' => 'public/users#validation_ajax'
	post 'validation_aj' => 'public/users#validation_ajax'
	##resources :users
	##resources :sessions



	scope "public" do
  #namespace :public do
	#get "sessions/new"

	root :to => "public/users#index"

	post 'users/validation_ajax'
	post 'users/validation_aj' => 'public/users#validation_ajax'
	post 'users/:id/validation_aj' => 'public/users#validation_ajax'
	

	resources :users, controller:"public/users"
	resources :sessions, controller:"public/sessions"
	end
	
end
