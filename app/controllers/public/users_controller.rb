# -*- coding: utf-8 -*-
class Public::UsersController < ApplicationController
before_filter :find_user, only: [:edit, :update]
layout 'create_user', only: [:new, :create]

  def index
    
    if current_user
      @user = User.find(current_user.id) 
      @profile=@user.pictures.first if @user.pictures

      # #render json: Profile.all
    end
  end

  def edit
    
  end

	def new
		@user = User.new
	end

  def validation_ajax  
    
    @data=User.new(email: params['email_form'])
    @data.valid?

    if current_user && current_user.email==params['email_form']
      
      render :js => "response_='V'"
      return
    end

    if @data.errors[:email].length==0
      
      render :js => "response_='V'"
      return
    else
      render :inline => "response_='<%= @data.errors[:email].first %>'"
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

    if User.maximum(:position)
      @user.position=User.maximum(:position)+1
    else
      @user.position=1
    end

    
    #render json: params[:user][:image]
    

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
