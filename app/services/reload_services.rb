class ReloadServices
  def initialize(reload)
    @reload = reload
    @wallet = Wallet.find_by(user_id: reload.user_id)
  end

  def reload_check_bank
    
  end

  def add_reload_to_wallet
    @total = @reload.amount.to_i + @wallet.balance.to_i
    @wallet.update_attributes(balance: @total)
  end
end
