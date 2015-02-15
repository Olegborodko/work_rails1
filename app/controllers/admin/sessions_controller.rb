class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    user = Admin.authenticate(person_params[:email],person_params[:password])
    if user
      session[:admin_id] = user.id
      redirect_to admin_administrators_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  

  def destroy
    session[:admin_id] = nil
    redirect_to admin_url, :notice => "Logged out!"
  end

  private 

   def person_params
      params.require(:admin).permit(:email, :password)
   end

end
