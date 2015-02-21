class Admin::AdministratorsController < ApplicationController
  include Edit_User_Position
	before_filter :find_user, only: [:edit, :update, :destroy]
  before_filter :current_admin?, only: [:edit_me,:update_me]
  before_filter :current_admin_id

  load_and_authorize_resource :user, except:[:show,:edit_me,:update_me], :parent => false

  def index

    if can? :manage, Admin
      redirect_to superadmin_sadmin_index_url
    else

      @users = all_user
  
    end

  end

  def show
    if params[:id]

     @sort=params[:id].split(',')

     @users=User.order("#{@sort[0]} #{@sort[1]}").paginate(:page => params[:page])

    end
  end

  def edit

  end

  def update
    @user.update_attributes(person_params)
    @users=all_user

     respond_to do |format|
      if @user.errors.empty?

         format.js{@rezult=true}
         format.html{redirect_to admin_url}
      else

         format.js{@rezult=false}
         format.html{render "edit"}
      end
     end
  end


  def destroy

    @users=all_user
    @user.destroy

  end

  def sort
    @params=params['param1']

    edit_user_position(@params)

  end

  def edit_me
    @admin=Admin.find(current_admin.id)
  end

  def update_me
     @admin=Admin.find(current_admin.id)
     @admin.update_attributes(person_params_admin)
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def all_user
      User.order("position ASC").paginate(:page => params[:page])
    end

    def person_params
      params.require(:user).permit(:last_name,:first_name,
  :email,:password,:information,:password_confirmation)
    end

    def person_params_admin
      params.require(:admin).permit(:last_name,:first_name,
  :email,:information)
    end

    def current_admin?
       authorize
    end

    def current_admin_id
      @admin=current_admin
    end


end
