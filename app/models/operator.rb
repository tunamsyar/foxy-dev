class Operator < ApplicationRecord
  has_many :transactions
  has_many :operator_pins
  has_many :operator_commissions
end
