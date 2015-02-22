# -*- coding: utf-8 -*-
class Public::RecoverPasswordController < ApplicationController

	def new
	end

	def create
		@user = User.where("email = ?", params[:user][:email]).first

		if !@user
			redirect_to new_session_url, alert: 'sorry, information about you is not correct, please get registered'
			return 
		end

		if @user[:first_name]==params[:user][:first_name] and 
			 @user[:last_name]==params[:user][:last_name] and
 			 @user.secret_word?(params[:user][:secret])
    

		    @user.update_attributes(person_params)

		    if @user.errors.empty?        
        	flash[:good]='you password change, please sign in'
      	else
        	flash[:alert]='sorry, information about you is not correct'
      	end

		    #render json:  @user.secret_word?(params[:user][:secret])
		    

		else

				flash[:alert]='sorry, information about you is not correct'
		end

		redirect_to new_session_url 

	end

	private 

  def person_params
      params.require(:user).permit(:password, :password_confirmation)
  end


end