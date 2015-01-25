class Admin::AdministratorsController < ApplicationController
	before_filter :find_user, only: [:edit, :update, :destroy]

  load_and_authorize_resource :user, :parent => false


  def index

    if can? :manage, Admin 
      redirect_to superadmin_sadmin_index_url
    else 
      @users=User.all

    end

  end

  def edit

  end

  def update
    @user.update_attributes(params[:user])
    
      if @user.errors.empty?        
        redirect_to admin_url
      else
        render "edit"
      end
  end

  def destroy
    @user.delete
    redirect_to admin_url
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

end
