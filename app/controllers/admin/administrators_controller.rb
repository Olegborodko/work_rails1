class Admin::AdministratorsController < ApplicationController
	before_filter :find_user, only: [:edit, :update]
  #before_filter :authorize, only: [:destroy]

  load_and_authorize_resource :admin, :parent => false


  def index

    if can? :manage, :all 
      redirect_to superadmin_sadmin_index_url
    else 
      @users=User.all

    end

  end

  def edit

  end

	def new
		@user = Admin.new
	end

  def update

  end

  def create
    
  end

  def destroy
    #session[:admin_id] = nil
    #redirect_to admin_url, :notice => "Logged out!"
    @user = User.find(params[:id])
    @user.delete
    redirect_to admin_url
  end

  private
    def find_user
      @user = Admin.find(params[:id])
    end

end
