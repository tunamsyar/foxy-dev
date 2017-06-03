class TransactionsController < ApplicationController

  def index; end

  def new
    @trx = Transaction.new
  end

  def create
    @trx = current_user.transactions.build(tran_params)
    if @trx.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def tran_params
    params.require(:transaction).permit(:phone_number, :amount, :commission)
  end
end
