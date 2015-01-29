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

    respond_to do |format|
      if @user.errors.empty?   
        @users=User.all
        format.js{@rezult=true}
        format.html{redirect_to admin_url}
      else
        format.js{@rezult=false}
        format.html{render "edit"}
      end
    end
  end


  def destroy
    @user.delete
    @users=User.all
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

end
