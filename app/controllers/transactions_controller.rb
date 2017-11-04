class TransactionsController < ApplicationController
  before_action :active_users_only
  before_action :assign_operators
  before_action :check_wallet, only: [:create]

  def index; end

  def new
    @trx = Transaction.new
  end

  def create
    @trx = current_user.transactions.build(tran_params)
    if @trx.save
      TransactionServices.new(@trx).deduct_wallet
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def check_wallet
    return if balance > 10
    redirect_to new_transaction_path
    flash[:error] = 'Not Enough balance'
  end

  def tran_params
    params.require(:transaction)
          .permit(:phone_number, :amount, :commission, :operator_id)
  end

  def assign_operators
    @operators = Operator.all
  end

  def balance
    current_user.wallet.balance.to_i
  end
end
