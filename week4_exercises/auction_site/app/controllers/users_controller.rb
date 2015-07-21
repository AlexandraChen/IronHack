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
			redirect_to user_path(@user), notice: 'User was successfully created.'
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
  # Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :email)
	end

end
