class Public::UsersController < ApplicationController
before_filter :find_user, only: [:edit, :update]

  def index
@user = User.find(current_user.id) if current_user
  end

  def edit
    
  end

	def new
		@user = User.new
	end

  def validation_ajax  
    
    @data=User.new(email: params['email_form'])
    @data.valid?

    if current_user && (params['email_form']==params['email_form_ch'])
      
      render :text => "V"
      return
    end

    if @data.errors[:email].length==0
      
      render :text => "V"
      return
    else
      render :inline => "<%= @data.errors[:email].first %>"
      return
    end  

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
    @user = User.new(params[:user]) #?
    if @user.save

      session[:user_id] = @user.id

      redirect_to root_url, :notice => "Signed up!"


    else
      render "new"
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end
end
