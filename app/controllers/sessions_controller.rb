class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "Welcome to iChanknows #{user.username}"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "email or password is incorrect"
			render 'new' 
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path 
	end

end 