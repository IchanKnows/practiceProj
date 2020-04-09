class AccountsController < ApplicationController

	before_action :set_account, only: [:edit, :update, :show, :destroy] 

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)
		if @account.save
			flash[:notice] = "account created!"
			redirect_to account_path(@account)
		else
			render :new
		end		
	end

	def show
	end

	def edit	
	end

	def update		
		if @account.update(account_params)
			flash[:notice] = "account updated!"
			redirect_to account_path(@account)
		else
			render :edit
		end		
	end

	def index
		@accounts = Account.all
	end

	def destroy
		@account.destroy
		flash[:notice] = "account #{@account.name} successfully deleted!"
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
