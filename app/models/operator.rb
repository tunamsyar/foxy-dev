class Operator < ApplicationRecord
  has_many :transactions
  has_many :operator_pins
  has_many :operator_commissions
  has_many :operator_rates

  enum local_international: [:local, :international]
end
