class Admin::AdministratorsController < ApplicationController
	before_filter :find_user, only: [:edit, :update, :destroy]

  load_and_authorize_resource :user, except:[:show], :parent => false


  def index

    if can? :manage, Admin 
      redirect_to superadmin_sadmin_index_url
    else 

      @users = all_user
    end

  end

  def show
    if params[:id]

     @s=params[:id].split(',')

     @users=User.order("#{@s[0]} #{@s[1]}").paginate(:page => params[:page])
  
    end
  end

  def edit
    
  end

  def update
    @user.update_attributes(params[:user])

    respond_to do |format|
      if @user.errors.empty?   

        @users=all_user

        format.js{@rezult=true}
        format.html{redirect_to admin_url}
      else
        format.js{@rezult=false}
        format.html{render "edit"}
      end
    end
  end


  def destroy
    @user.destroy
    session[:user_id] = nil #delete
    @users=all_user
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def all_user
      User.paginate(:page => params[:page])
    end


end
