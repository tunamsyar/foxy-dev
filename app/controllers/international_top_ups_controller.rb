class InternationalTopUpsController < ApplicationController
  before_action :active_users_only
  before_action :assign_international_operators
  
  def index; end

  def new
    @inter_top_up = InternationalTopUp.new
  end

  def create
    binding.pry
    @inter_top_up = current_user.international_top_ups.build(tran_params)
    if @inter_top_up.save
      InternationalTopUpServices.new(@inter_top_up).deduct_wallet
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tran_params
    params.require(:international_top_up)
          .permit(:phone_number, :amount, :commission, :operator_id)
  end

  def assign_international_operators
    @operators = Operator.all.international
  end
end