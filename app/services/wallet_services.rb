class WalletServices
  def initialize(user)
    @user = user
  end

  def init_wallet
    Wallet.create(user_id: @user.id, balance: 0)
  end
end