class PinsController < ApplicationController
  before_action :assign_operators
  before_action :assign_operator_rates

  def new
    @pin = OperatorPin.new
  end

  def create
  end

  private

  def pin_params
    params.require[:operator_pin].permit()
  end

  def assign_operator_rates
    @operator_rates = OperatorRate.all
  end

  def assign_operators
    @operators = Operator.all
  end
end
