class ReloadServices
  def initialize(reload)
    @reload = reload
    @transaction_date = transaction_date(reload)
    @transaction_time = transaction_time(reload)
    @wallet = Wallet.find_by(user_id: reload.user_id)
    @reload_link = reload_link(reload, transaction_date, transaction_time)
  end

  def reload_check_bank
    if @reload.source == "CIMB"
      
    else
    end
  end

  def reload_link(reload, transaction_date, transaction_time)
    "#{ENVied.TOPUP_SERVER}/ewallet?bank=cimb&type=#{reload.transaction_type}"\
    "&amount=#{reload.amount}&date=#{transaction_date}"\
    "&time=#{transaction_time}&ref=#{reload.reference_no}"
  end

  def add_reload_to_wallet
    @total = @reload.amount.to_i + @wallet.balance.to_i
    @wallet.update_attributes(balance: @total)
  end

  def transaction_time(reload)
    reload.transaction_time.strftime("%H%M")
  end

  def transaction_date(reload)
    reload.transaction_date.strftime("%d%m%Y")
  end

  def send_check
    @reponse = HTTParty.get(@reload_link)
  end
end
