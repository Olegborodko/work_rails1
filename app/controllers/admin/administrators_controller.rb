class Admin::AdministratorsController < ApplicationController
	before_filter :find_user, only: [:edit, :update]

  def index
   @user = Admin.find(current_user.id) if current_user
  end

  def edit
    
  end

	def new
		@user = Admin.new
	end

  def update
    
    @user.update_attributes(params[:user])
    
    respond_to do |format|
      if @user.errors.empty?
        
        format.js{@rezult=true}
      else
        format.js{@rezult=false}
      end
    end

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

  private
    def find_user
      @user = Admin.find(params[:id])
    end
end
