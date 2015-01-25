class Superadmin::SadminController < ApplicationController
	before_filter :find_user, only: [:edit, :update, :destroy]
	load_and_authorize_resource :admin, :parent => false

	def index
		
		#@admins = Admin.all(:include => :role, :conditions => { :roles => { :name => 'admin'} })

		@admins= Admin.includes(:role).where('roles.name != ?', 'super_admin')

	end

	def new
		@user = Admin.new
	end

	def show
	end

	def create
		@user = Admin.new(params[:admin])

		@user.role=Role.new(name:'admin')

    if @user.save

      redirect_to superadmin_sadmin_index_url, :notice => "Signed up!"

    else
      render "new"
    end
	end

	def edit

	end

	def update
    @user.update_attributes(params[:admin])
    
      if @user.errors.empty?        
      	redirect_to superadmin_sadmin_index_url
      else
        render "edit"
      end
  end

	def destroy
    @user.destroy
    redirect_to superadmin_sadmin_index_url
  end

  private
    def find_user
      @user = Admin.find(params[:id])
    end

	
	
end
