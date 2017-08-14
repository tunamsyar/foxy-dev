class WalletsController < ApplicationController
  before_action :active_users_only
  before_action :set_reloads_history, only: [:index]

  def new
    @wallet = Wallet.new
  end

  def create; end

  def index
    @wallet = current_user.wallet
  end

  private

  def wallet_params
    params.require(:wallet).permit(:user_id, :reference_id, :balance)
  end

  def set_reloads_history
    @reloads = current_user.reloads
  end
end
