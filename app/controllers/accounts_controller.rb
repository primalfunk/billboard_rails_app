class AccountsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update]

  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      flash[:success] = 'Account Created'
      redirect_to accounts_path
    else
      flash[:error] = "Error: #{@account.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to account_path
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
  end

  private
    def account_params
      params.require(:account).permit(:name, :balance)
    end

    def set_account
      @account = current_user.accounts.find(params[:id])
    end
end