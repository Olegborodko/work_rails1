class UsersController < ApplicationController

  def index

  end

  def edit
    @user = User.find(params[:id])
  end

	def new
		@user = User.new
	end

  def update

    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if @user.errors.empty?
      
     redirect_to root_url
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(params[:user]) #?
    if @user.save

      session[:user_id] = @user.id

      redirect_to root_url, :notice => "Signed up!"


    else
      render "new"
    end
  end

end
