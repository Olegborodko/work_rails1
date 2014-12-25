class UsersController < ApplicationController

  def index
   
   password_salt = BCrypt::Engine.generate_salt
      @password_hash = BCrypt::Engine.hash_secret('123', password_salt)

 
  end

	def new
		@user = User.new
	end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
