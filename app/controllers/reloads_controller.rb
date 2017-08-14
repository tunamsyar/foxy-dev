class ReloadsController < ApplicationController
  before_action :active_users_only

  def new
    @reload = Reload.new
  end

  def create
    @reload = current_user.reloads.build(reload_params)
    if @reload.save
      ReloadServices.new(@reload).reload_check_bank
      redirect_to root_path
    else
      flash[:alert] = @reload.errors.full_messages.to_s
      render :new
    end
  end

  private

  def set_wallet
    @wallet = current_user.wallet.balance.to_i
  end

  def set_reload
    @reload_amount = current_user.reloads.success
  end

  def reload_params
    params.require(:reload)
          .permit(
            :source, :amount, :reference_no, :message,
            :image, :transaction_type
          )
  end
end
