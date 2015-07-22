class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find_by(id: params[:id]) 
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		 if @user.valid?
			@user.save
			redirect_to '/', notice: 'Your account was successfully created. Log in'
	    else
	      render :new
	    end
	end

	def destroy
		@user = User.find_by(id: params[:id])
		@user.destroy
		redirect_to "/"
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
