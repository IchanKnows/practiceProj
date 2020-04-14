class WelcomeController < ApplicationController
	
	def home
		redirect_to accounts_path if logged_in? 
	end

	def about
		
	end

end