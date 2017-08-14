class TransactionServices
  def initialize(transaction)
    @transaction = transaction
    @wallet = Wallet.find_by(user_id: transaction.user_id)
  end

  def deduct_wallet
    @total = @wallet.balance.to_i - @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
    # check_status
  end

  def refund_wallet
    @total = @wallet.balance.to_i + @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
  end

  def check_status
    # if request status returns ok
    # then updates @transaction.success!
    #else
    # @transaction.failed!
    # refund_wallet
  end
end
