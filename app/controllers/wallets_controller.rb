class WalletsController < ApplicationController
  def new
    @wallet = Wallet.new
  end

  def create
    binding.pry
  end

  private

  def wallet_params
    params.require(:wallet).permit(:user_id, :reference_id, :balance)
  end
end
