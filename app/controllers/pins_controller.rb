class PinsController < ApplicationController
  before_action :active_users_only
  before_action :assign_operators

  def new
    @pin = OperatorPin.new
  end

  def create
    @pin = current_user.operator_pins.build(pin_params)
    if @pin.save
      PinServices.new(@pin).deduct_wallet
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def pin_params
    params.require(:operator_pin).permit(:amount, :operator_id)
  end

  def assign_operators
    @operators = Operator.all
  end
end
