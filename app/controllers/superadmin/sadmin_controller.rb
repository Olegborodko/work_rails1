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
		@user = Admin.new(resource_params)

		@user.role=Role.where(name:'admin').first

		#@user.role=r[:id]

     if @user.save

       redirect_to superadmin_sadmin_index_url, :notice => "Signed up!"

     else
       render "new"
     end
	end

	def edit

	end

	def update
    @user.update_attributes(resource_params)
    
      if @user.errors.empty?        
      	redirect_to superadmin_sadmin_index_url
      else
        render "edit"
      end
  end

	def destroy
    @user.delete
    redirect_to superadmin_sadmin_index_url
  end

  private
    def find_user
      @user = Admin.find(params[:id])
    end

    def resource_params
    	params.require(:admin).permit(:last_name,:first_name,
  :email,:password,:information,:password_confirmation)
		end
end
