class PinsController < ApplicationController
  before_action :assign_operators

  def new
    @pin = OperatorPin.new
  end

  def create
  end

  private

  def assign_operators
    @operators = Operator.all
  end
end
