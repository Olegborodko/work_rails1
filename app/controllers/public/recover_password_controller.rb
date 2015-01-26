class Public::RecoverPasswordController < ApplicationController

	def new
	end

	def create
		@user = User.where("email = ?", params[:user][:email]).first

		if !@user
			redirect_to new_session_url, alert: 'sorry, information about you is not correct'
			return 
		end

		if @user[:first_name]==params[:user][:first_name] and 
			 @user[:last_name]==params[:user][:last_name] and
 			 @user.secret_word?(params[:user][:secret])
    

		    @user.update_attributes(params[:user])

		    #render json:  @user.secret_word?(params[:user][:secret])
		    redirect_to new_session_url, flash: { alert: 'you password change'}

		else

				redirect_to new_session_url, alert: 'sorry, information about you is not correct'
		end

	end


end