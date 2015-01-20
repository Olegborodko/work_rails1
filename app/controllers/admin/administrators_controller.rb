class Admin::AdministratorsController < ApplicationController
	before_filter :find_user, only: [:edit, :update]
  before_filter :authorize, only: [:destroy]

  def index
   #@user = Admin.find(current_admin.id) if current_admin
   @users=User.all

  end

  def edit
    
  end

	def new
		@user = Admin.new
	end

  def update

  end

  def create
    @user = Admin.new(params[:admin]) #?
    if @user.save

      session[:admin_id] = @user.id

      redirect_to admin_url, :notice => "Signed up!"


    else
      render "new"
    end
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
