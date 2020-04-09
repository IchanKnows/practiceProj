class AccountsController < ApplicationController

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
		@account = Account.find(params[:id])
	end

	def edit
		@account = Account.find(params[:id])	
	end

	def update
		@account = Account.find(params[:id])
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
		@account = Account.find(params[:id])
		@account.destroy
		flash[:notice] = "account #{@account.name} successfully deleted!"
		redirect_to accounts_path
	end

	private
	def account_params
		params.require(:account).permit(:name, :motto)	
	end
		
end
