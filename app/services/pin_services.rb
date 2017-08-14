class PinServices
  def initialize(pin)
    @pin = pin
    @wallet = Wallet.find_by(user_id: pin.user_id) 
  end

  def deduct_wallet
    @total = @wallet.balance.to_i - @pin.amount
    @wallet.update_attributes(balance: @total)
    # check_status
  end

  def check_status
    #request check status
  end

  def refund_wallet
    @total = @wallet.balance.to_i + @pin.amount
    @wallet.update_attributes(balance: @total)
  end
end