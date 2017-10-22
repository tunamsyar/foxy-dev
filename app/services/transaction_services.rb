class TransactionServices
  include HTTParty
  
  def initialize(transaction)
    @transaction = transaction
    @wallet = Wallet.find_by(user_id: transaction.user_id)
    @operator = Operator.find(transaction.operator_id).operator_name.downcase
    @link = top_up_link(@operator, @transaction)
    @top_up_status = status_link(@transaction)
  end

  def top_up_link(operator,transaction)
    "#{ENVied.TOPUP_SERVER}/#{operator}?web_id=#{transaction.id}"\
    "&phone=#{transaction.phone_number}&amount=#{transaction.amount.to_i}"
  end

  def status_link(transaction)
    "#{ENVied.TOPUP_SERVER}/status/#{transaction.id}"
  end

  def deduct_wallet
    @total = @wallet.balance.to_i - @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
    send_topup
  end

  def refund_wallet
    @total = @wallet.balance.to_i + @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
  end

  def send_topup
    @response = HTTParty.get(@link)
    refund_wallet unless @response.code == 201
    StatusWorker.perform_in(30.seconds, @top_up_status, @transaction.id)
  end
end
