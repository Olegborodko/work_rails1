WorkRails1::Application.routes.draw do


	post 'validation_ajax' => 'public/users#validation_ajax'
	post 'validation_aj' => 'public/users#validation_ajax'
	post 'public/users/validation_ajax'
	post 'public/users/validation_aj' => 'public/users#validation_ajax'
	post 'public/validation_aj'=> 'public/users#validation_ajax'
	post 'public/validation_ajax'=> 'public/users#validation_ajax'


	post 'sort_bd' => 'admin/administrators#sort'
	post 'admin/sort_bd' =>'admin/administrators#sort'


  root :to => "public/users#index"

	scope "public" do
  	get '/' => 'public/users#index'
		resources :users, controller:"public/users"
		resources :sessions, controller:"public/sessions"

		resources :recover_password, controller:"public/recover_password"

		resources :pictures, controller:"public/pictures"
	end

	namespace :admin do 
		get '/' => 'administrators#index'
		resources :administrators
		resources :sessions
	end

	namespace :superadmin do
		resources :sadmin
	end

	
end
