class UsersController < ApplicationController
	before_action :authorize_user, only: [:show]
	before_action :admin_only, only: [:index]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	    if @user.save
	      redirect_to '/'
	    else
	      render :new
	    end
	end

	def index
		@users = User.all
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
