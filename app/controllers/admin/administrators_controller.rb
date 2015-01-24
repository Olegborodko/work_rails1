class Admin::AdministratorsController < ApplicationController
	before_filter :find_user, only: [:edit, :update]
  #before_filter :authorize, only: [:destroy]

  load_and_authorize_resource :admin, :parent => false


  def index

   
   @users=User.all
   @admins=Admin.all
   #render text: '111'

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
