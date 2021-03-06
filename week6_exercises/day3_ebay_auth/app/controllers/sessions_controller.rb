class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user.id)
		else
			redirect_to '/login'
		end
	end

	def delete
		session.clear
		redirect_to '/'
	end

end
