class AccountsController < ApplicationController

	before_action :set_account, only: [:edit, :update, :show, :destroy] 

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		@account.user = User.first 
		if @account.save
			flash[:success] = "account created!"
			redirect_to account_path(@account)
		else
			render :new
		end		
	end

	def show
		@accounts = Account.find(params[:id]) 
	end

	def edit	
	end

	def update		
		if @account.update(account_params)
			flash[:success] = "account updated!"
			redirect_to account_path(@account)
		else
			render :edit
		end		
	end

	def index
		# @accounts = Account.all
		@accounts = Account.paginate(page: params[:page], per_page: 5)  
	end

	def destroy
		@account.destroy
		flash[:danger] = "account #{@account.name} successfully deleted!"
		redirect_to accounts_path
	end

	private
	def set_account
		@account = Account.find(params[:id])	
	end
	def account_params
		params.require(:account).permit(:name, :motto)	
	end
		
end
