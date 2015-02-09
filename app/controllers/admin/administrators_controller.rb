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

     @sort=params[:id].split(',')

     @users=User.order("#{@sort[0]} #{@sort[1]}").paginate(:page => params[:page])

    end
  end

  def edit

  end

  def update
    @user.update_attributes(params[:user])
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

    @params.select! {|x| x!="" }

    return if @params.first.split('_')[3] != 'position'


    if @params.first.split('_')[4] == 'ASC'
      sort_up_to_down=true
    else
      sort_up_to_down=false
    end

#-----------------------------

    if sort_up_to_down
      #min

       for value in @params
        m=value.split('_')[2].to_i
        min=m if !min
        min=m if m<min
      end

    else
      #max

      for value in @params
        m=value.split('_')[2].to_i
        max=m if !max
        max=m if m>max
      end

    end

#-----------------------------

     for value in @params
      m=value.split('_')

      user=User.find(m[1])

        if sort_up_to_down
          user.position=min
          min=min+1
        else
          user.position=max
          max=max-1
        end
      
      user.save
      p user.position


     end

  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def all_user
      User.order("position ASC").paginate(:page => params[:page])
    end


end
